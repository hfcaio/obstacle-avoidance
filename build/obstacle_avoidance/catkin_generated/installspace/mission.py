#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Point, PoseStamped
from mavros_msgs.srv import SetMode, CommandBool, CommandTOL 


if __name__ == '__main__':
    rospy.init_node('mission')
    rospy.loginfo('Mission node started')
    try:
        goal_pub = rospy.Publisher("/obstacle_avoidance/goal", Point, queue_size=10)
        rospy.loginfo('Goal publisher created')

        mode_service = rospy.ServiceProxy('/mavros/set_mode', SetMode)
        arm_service = rospy.ServiceProxy('/mavros/cmd/arming', CommandBool)
        takeoff_service = rospy.ServiceProxy('/mavros/cmd/takeoff', CommandTOL)
        rospy.loginfo('Service proxies created')

        mode_service(custom_mode="4")
        rospy.sleep(0.1)
        arm_service(True)
        takeoff_service(altitude=8.0)

        #while not res_arm.success and not res_mode.success and not res_takeoff.success:
        #    rospy.logwarn('Failed to arm, set mode, or takeoff')
        #    rospy.sleep(0.1)
        rospy.loginfo('Armed, set mode, and took off successfully')
        rospy.sleep(5)
        
        rate = rospy.Rate(5)
        if not rospy.is_shutdown():
            goal = Point()
            goal.x = 10.0
            goal.y = 0.0

            rospy.loginfo('Publishing goal: {}'.format(goal))
            goal_pub.publish(goal)
            rospy.sleep(5)
            rate.sleep()

        rospy.spin()
    except rospy.ROSInterruptException:
        pass