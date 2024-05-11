# CMake generated Testfile for 
# Source directory: /home/sky/obstacle-avoidance/src/obstacle-avoidance
# Build directory: /home/sky/obstacle-avoidance/build/obstacle_avoidance
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_obstacle_avoidance_roslaunch-check_launch "/home/sky/obstacle-avoidance/build/obstacle_avoidance/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/sky/obstacle-avoidance/build/obstacle_avoidance/test_results/obstacle_avoidance/roslaunch-check_launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/sky/obstacle-avoidance/build/obstacle_avoidance/test_results/obstacle_avoidance" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/sky/obstacle-avoidance/build/obstacle_avoidance/test_results/obstacle_avoidance/roslaunch-check_launch.xml\" \"/home/sky/obstacle-avoidance/src/obstacle-avoidance/launch\" ")
set_tests_properties(_ctest_obstacle_avoidance_roslaunch-check_launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/sky/obstacle-avoidance/src/obstacle-avoidance/CMakeLists.txt;21;roslaunch_add_file_check;/home/sky/obstacle-avoidance/src/obstacle-avoidance/CMakeLists.txt;0;")
subdirs("gtest")
