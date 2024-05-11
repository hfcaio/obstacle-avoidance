#include <ros/ros.h>

using namespace ros;

struct node {
    geometry_msgs::Point point;
    std::vector<node*> adjacent;
};

struct graph {
    std::vector<node*> nodes;
};


// declaring functions
void localPoseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg);
void obstacleCallback(const obstacle_avoidance::Points::ConstPtr& msg);
void goalCallback(const geometry_msgs::Point::ConstPtr& msg);
void D_star(geometry_msgs::Point start, geometry_msgs::Point goal);


int main(int argc, char** argv) {
    init(argc, argv, "A*");
    ROS_INFO("A* node started");
    NodeHandle nh;
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
    Duration(10).sleep();
    D_star(position, goal);
}

void rrt_star(geometry_msgs::Point start, geometry_msgs::Point goal) {
}