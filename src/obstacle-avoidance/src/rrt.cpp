#include <vector>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/PoseStamped.h>
#include "obstacle_avoidance/Points.h"
#include <tf/tf.h>
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
float dist = 1.3, clearence = 2, step_size = 1; // distance between nodes and clearence from obstacles

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
    Rate loop_rate(10);

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
    rrt(position, goal);
}

void rrt(geometry_msgs::Point start, geometry_msgs::Point goal) {
    tree t;
    t.root = new node;
    t.root->point = start;
    t.root->parent = nullptr;
    t.nodes.push_back(t.root);

    while (true) {
        geometry_msgs::Point random;
        random.x = rand() % 100;
        random.y = rand() % 100;
        random.z = 0;

        ROS_INFO("random points: x: %f, y: %f", random.x, random.y);

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
        }

        ROS_INFO("new nodes: x: %f, y: %f and the distance = %f", new_point.x, new_point.y, sqrt(pow(new_point.x - goal.x, 2) + pow(new_point.y - goal.y, 2)));

        if (sqrt(pow(new_point.x - goal.x, 2) + pow(new_point.y - goal.y, 2)) < dist) {
            node* goal_node = new node;
            goal_node->point = goal;
            goal_node->parent = nearest;
            nearest->children.push_back(goal_node);
            t.nodes.push_back(goal_node);
            break;
        }
        //Duration(1).sleep();
    }

    // backtracking
    node* current = t.nodes[t.nodes.size() - 1];
    NodeHandle nh;
    Publisher pub_path = nh.advertise<geometry_msgs::PoseStamped>("/mavros/setpoint_position/local", 10);

    while (current->parent != nullptr) {
        ROS_INFO("x: %f, y: %f", current->point.x, current->point.y);

        for (geometry_msgs::Point obstacle : obstacles) {
            if (sqrt(pow(current->parent->point.x - obstacle.x, 2) + pow(current->parent->point.y - obstacle.y, 2)) < clearence) {
                ROS_INFO("RRT recall from x: %f, y: %f to x: %f, y: %f", current->point.x, current->point.y, goal.x, goal.y);
                Duration(10).sleep();
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

            pub_path.publish(next);
            spinOnce();

            while (abs(position.x - next.pose.position.x) > 0.1 && abs(position.y - next.pose.position.y) > 0.1) {
                ROS_INFO("wait until drone reaches the goal");
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
}