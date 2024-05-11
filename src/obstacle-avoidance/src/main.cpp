#include <array>
#include <vector> 
#include "obstacle_avoidance/Points.h"
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <sensor_msgs/LaserScan.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Point.h>
using namespace ros;

//global variables
geometry_msgs::Point position;
std::vector<geometry_msgs::Point> obstacles;
Publisher pub_obstacles;

//declaring functions 
void drawObstacles(float theta, float distance);
void lidarCallback(const sensor_msgs::LaserScan::ConstPtr& msg);
void localPoseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg);


int main(int argc, char** argv) {
    ros::init(argc, argv, "obstacle_avoidance");
    NodeHandle nh;
    ROS_INFO("Obstacle avoidance node started");
    Subscriber sub_lidar_distances = nh.subscribe("/spur/laser/scan", 10, lidarCallback);
    Subscriber sub_local_pose = nh.subscribe("/mavros/local_position/pose", 10, localPoseCallback);

    pub_obstacles = nh.advertise<obstacle_avoidance::Points>("/obstacle_avoidance/obstacles", 10);
    Rate loop_rate(10);

    spin();
    return 0;
}

//

void drawObstacles(float theta, float distance) {
    geometry_msgs::Point point;
    point.x = distance * cos(theta) + position.x;
    point.y = distance * sin(theta) + position.y;
    point.z = position.z;
    obstacles.push_back(point);

    obstacle_avoidance::Points msg;
    msg.points = obstacles;
    pub_obstacles.publish(msg);
}

void localPoseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg) {
    position.x = msg->pose.position.x;
    position.y = msg->pose.position.y;
    position.z = msg->pose.position.z;
}

void lidarCallback(const sensor_msgs::LaserScan::ConstPtr& msg) {
    float size = end(msg->ranges) - begin(msg->ranges);
    for (int i = 0; i < size; i++) {
        if (msg->ranges[i] < 3) {
            Duration(0.1).sleep();
            if (msg->ranges[i] < 3) drawObstacles(msg->angle_min + i * msg->angle_increment, msg->ranges[i]);
        }
    }
}