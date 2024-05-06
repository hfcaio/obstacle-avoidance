# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "obstacleAvoidance: 1 messages, 0 services")

set(MSG_I_FLAGS "-IobstacleAvoidance:/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(obstacleAvoidance_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_custom_target(_obstacleAvoidance_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obstacleAvoidance" "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" "geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(obstacleAvoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleAvoidance
)

### Generating Services

### Generating Module File
_generate_module_cpp(obstacleAvoidance
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleAvoidance
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(obstacleAvoidance_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(obstacleAvoidance_generate_messages obstacleAvoidance_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleAvoidance_generate_messages_cpp _obstacleAvoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleAvoidance_gencpp)
add_dependencies(obstacleAvoidance_gencpp obstacleAvoidance_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleAvoidance_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(obstacleAvoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleAvoidance
)

### Generating Services

### Generating Module File
_generate_module_eus(obstacleAvoidance
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleAvoidance
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(obstacleAvoidance_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(obstacleAvoidance_generate_messages obstacleAvoidance_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleAvoidance_generate_messages_eus _obstacleAvoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleAvoidance_geneus)
add_dependencies(obstacleAvoidance_geneus obstacleAvoidance_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleAvoidance_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(obstacleAvoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleAvoidance
)

### Generating Services

### Generating Module File
_generate_module_lisp(obstacleAvoidance
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleAvoidance
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(obstacleAvoidance_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(obstacleAvoidance_generate_messages obstacleAvoidance_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleAvoidance_generate_messages_lisp _obstacleAvoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleAvoidance_genlisp)
add_dependencies(obstacleAvoidance_genlisp obstacleAvoidance_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleAvoidance_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(obstacleAvoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleAvoidance
)

### Generating Services

### Generating Module File
_generate_module_nodejs(obstacleAvoidance
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleAvoidance
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(obstacleAvoidance_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(obstacleAvoidance_generate_messages obstacleAvoidance_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleAvoidance_generate_messages_nodejs _obstacleAvoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleAvoidance_gennodejs)
add_dependencies(obstacleAvoidance_gennodejs obstacleAvoidance_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleAvoidance_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(obstacleAvoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleAvoidance
)

### Generating Services

### Generating Module File
_generate_module_py(obstacleAvoidance
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleAvoidance
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(obstacleAvoidance_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(obstacleAvoidance_generate_messages obstacleAvoidance_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleAvoidance_generate_messages_py _obstacleAvoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleAvoidance_genpy)
add_dependencies(obstacleAvoidance_genpy obstacleAvoidance_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleAvoidance_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleAvoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleAvoidance
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(obstacleAvoidance_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleAvoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleAvoidance
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(obstacleAvoidance_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleAvoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleAvoidance
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(obstacleAvoidance_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleAvoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleAvoidance
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(obstacleAvoidance_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleAvoidance)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleAvoidance\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleAvoidance
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(obstacleAvoidance_generate_messages_py geometry_msgs_generate_messages_py)
endif()
