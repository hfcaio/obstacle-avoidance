#include <vector>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h>
#include "obstacle_avoidance/Points.h"
#include <tf/tf.h>
#include <mavros_msgs/PositionTarget.h>
using namespace ros;

//structs 
struct node {
    geometry_msgs::Point point;
    node* parent;
    std::vector<node*> children;
};

struct tree {
    node* root;
    std::vector<node*> nodes;
};

//global variables
geometry_msgs::Point position;
std::vector<geometry_msgs::Point> obstacles;
float dist = 4.5, clearence = 2.5, step_size = 1.2; // distance between nodes and clearence from obstacles

// declaring functions
void localPoseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg);
void obstacleCallback(const obstacle_avoidance::Points::ConstPtr& msg);
void goalCallback(const geometry_msgs::Point::ConstPtr& msg);
void rrt(geometry_msgs::Point start, geometry_msgs::Point goal);


int main(int argc, char** argv) {
    ros::init(argc, argv, "rrt");
    ROS_INFO("RRT node started");
    NodeHandle nh;
    Subscriber sub_local_pose = nh.subscribe("/mavros/local_position/pose", 10, localPoseCallback);
    Subscriber sub_obstacles = nh.subscribe("/obstacle_avoidance/obstacles", 10, obstacleCallback);
    Subscriber sub_goal = nh.subscribe("/obstacle_avoidance/goal", 10, goalCallback);
    Rate loop_rate(1);

    spin();
    return 0;
}

void localPoseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg) {
    position.x = msg->pose.position.x;
    position.y = msg->pose.position.y;
    position.z = msg->pose.position.z;
}

void obstacleCallback(const obstacle_avoidance::Points::ConstPtr& msg) {
    obstacles = msg->points;
}

void goalCallback(const geometry_msgs::Point::ConstPtr& msg) {
    geometry_msgs::Point goal;
    goal.x = msg->x;
    goal.y = msg->y;
    goal.z = msg->z;

    ROS_INFO("RRT started from x: %f, y: %f to x: %f, y: %f", position.x, position.y, goal.x, goal.y);
    Duration(1).sleep();
    rrt(position, goal);
}

float minimal_distance(geometry_msgs::Point goal, geometry_msgs::Point current) {
    return sqrt(pow(goal.x - current.x, 2) + pow(goal.y - current.y, 2));
}

float attraction_force(geometry_msgs::Point goal, geometry_msgs::Point current) {
    int k = 3, distance = minimal_distance(goal, current);
    return k * distance;
}

float repulsion_force(geometry_msgs::Point obstacle, geometry_msgs::Point current) {
    int q = 3, distance = minimal_distance(obstacle, current);
    return q / pow(distance, 2);
}

float get_angle(geometry_msgs::Point goal, geometry_msgs::Point current) {
    return atan2(goal.y - current.y, goal.x - current.x);
}

geometry_msgs::Point Bias(geometry_msgs::Point goal, geometry_msgs::Point current, int grid_size = 30) {
    geometry_msgs::Point random;
    random.x = rand() % (2 * grid_size) + (current.x) - grid_size;
    random.y = rand() % (2 * grid_size) + (current.y) - grid_size;
    random.z = 0;

    //ROS_INFO("random points: x: %f, y: %f", random.x, random.y);
    float theta = get_angle(goal, random);

    //ROS_INFO("theta: %f", theta * 180 / 3.14159);

    geometry_msgs::Point bias;
    bias.x = attraction_force(goal, random) * cos(theta) + repulsion_force(random, current) * cos(theta);
    bias.y = attraction_force(goal, random) * sin(theta) + repulsion_force(random, current) * sin(theta);

    //ROS_INFO("bias: x: %f, y: %f", bias.x, bias.y);

    random.x = random.x + bias.x;
    random.y = random.y + bias.y;

    //Duration(2).sleep();
    return random;
}

void rrt(geometry_msgs::Point start, geometry_msgs::Point goal) {
    tree t;
    t.root = new node;
    t.root->point = goal;
    t.root->parent = nullptr;
    t.nodes.push_back(t.root);

    geometry_msgs::Point curr = t.nodes[0]->point;
    while (true) {
        geometry_msgs::Point random = Bias(start, curr);

        node* nearest = t.nodes[0];
        for (node* n : t.nodes) {
            if (sqrt(pow(n->point.x - random.x, 2) + pow(n->point.y - random.y, 2)) <
                sqrt(pow(nearest->point.x - random.x, 2) + pow(nearest->point.y - random.y, 2))) {
                nearest = n;
            }
        }

        geometry_msgs::Point new_point;
        float theta = atan2(random.y - nearest->point.y, random.x - nearest->point.x);
        new_point.x = nearest->point.x + step_size * cos(theta);
        new_point.y = nearest->point.y + step_size * sin(theta);
        new_point.z = 0;

        bool collision = false;
        for (geometry_msgs::Point obstacle : obstacles) {
            if (sqrt(pow(new_point.x - obstacle.x, 2) + pow(new_point.y - obstacle.y, 2)) < clearence) {
                collision = true;
                break;
            }
        }

        if (!collision) {
            node* new_node = new node;
            new_node->point = new_point;
            new_node->parent = nearest;
            nearest->children.push_back(new_node);
            t.nodes.push_back(new_node);
            //ROS_INFO("new nodes: x: %f, y: %f and the distance = %f", new_point.x, new_point.y, sqrt(pow(new_point.x - start.x, 2) + pow(new_point.y - start.y, 2)));

            if (minimal_distance(new_point, start) < minimal_distance(curr, start)) {
                curr = new_point;
            }
        }

        if (sqrt(pow(new_point.x - start.x, 2) + pow(new_point.y - start.y, 2)) < dist) {
            node* goal_node = new node;
            goal_node->point = goal;
            goal_node->parent = nearest;
            nearest->children.push_back(goal_node);
            t.nodes.push_back(goal_node);
            break;
        }
        ROS_INFO("current node: x: %f, y: %f", curr.x, curr.y);
        ROS_INFO("Distance: %f", sqrt(pow(curr.x - start.x, 2) + pow(curr.y - start.y, 2)));
        //Duration(1).sleep();
    }

    // backtracking
    node* current = t.nodes[t.nodes.size() - 1];
    NodeHandle nh;
    Publisher pub_path = nh.advertise<geometry_msgs::PoseStamped>("/mavros/setpoint_position/local", 10);

    ROS_INFO("start movement from: x:%f y:%f", position.x, position.y);
    /*while (current->parent != nullptr) {
        ROS_INFO("go to: x=%f y=%f", current->parent->point.x, current->parent->point.y);
        current = current->parent;
    }*/

    while (current->parent != nullptr) {
        for (geometry_msgs::Point obstacle : obstacles) {
            if (sqrt(pow(goal.x - obstacle.x, 2) + pow(goal.y - obstacle.y, 2)) < clearence) {
                ROS_INFO("Obstacle in x:%f y:%f", obstacle.x, obstacle.y);
                ROS_INFO("Goal is in the obstacle area! IMPOSSIBLE TO REACH!");
                return;
            }
            if (sqrt(pow(current->parent->point.x - obstacle.x, 2) + pow(current->parent->point.y - obstacle.y, 2)) < clearence) {
                ROS_INFO("RRT recall from x: %f, y: %f to x: %f, y: %f", current->point.x, current->point.y, goal.x, goal.y);
                ROS_INFO("Obstacle in x:%f y:%f", obstacle.x, obstacle.y);
                Duration(1).sleep();
                rrt(current->point, goal);
                return;
            }
        }
        try {
            geometry_msgs::PoseStamped next;
            next.pose.position.x = current->parent->point.x;
            next.pose.position.y = current->parent->point.y;
            next.pose.position.z = position.z;

            tf2::Quaternion q;
            q.setRPY(0, 0, 1.57075);
            q.normalize();
            next.pose.orientation.x = q[0];
            next.pose.orientation.y = q[1];
            next.pose.orientation.z = q[2];
            next.pose.orientation.w = q[3];

            ROS_INFO("go to: x=%f y=%f", current->parent->point.x, current->parent->point.y);
            pub_path.publish(next);
            //pub_raw.publish(raw);
            spinOnce();
            Duration(0.01).sleep();

            while (abs(position.x - next.pose.position.x) > step_size || abs(position.y - next.pose.position.y) > step_size) {
                ROS_INFO("wait until drone reaches the next position: x:%f y:%f", next.pose.position.x, next.pose.position.y);
                Duration(1).sleep();

                pub_path.publish(next);
                spinOnce();
            }

            current = current->parent;
        }
        catch (int e) {
            ROS_INFO("An exception occurred. Exception Nr. %d", e);
        }
    }
    ROS_INFO("Goal reached!");
    return;
}