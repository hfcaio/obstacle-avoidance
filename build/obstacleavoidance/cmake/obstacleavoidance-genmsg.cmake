# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "obstacleavoidance: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iobstacleavoidance:/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(obstacleavoidance_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_custom_target(_obstacleavoidance_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "obstacleavoidance" "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" "geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(obstacleavoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleavoidance
)

### Generating Services

### Generating Module File
_generate_module_cpp(obstacleavoidance
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleavoidance
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(obstacleavoidance_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(obstacleavoidance_generate_messages obstacleavoidance_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleavoidance_generate_messages_cpp _obstacleavoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleavoidance_gencpp)
add_dependencies(obstacleavoidance_gencpp obstacleavoidance_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleavoidance_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(obstacleavoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleavoidance
)

### Generating Services

### Generating Module File
_generate_module_eus(obstacleavoidance
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleavoidance
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(obstacleavoidance_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(obstacleavoidance_generate_messages obstacleavoidance_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleavoidance_generate_messages_eus _obstacleavoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleavoidance_geneus)
add_dependencies(obstacleavoidance_geneus obstacleavoidance_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleavoidance_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(obstacleavoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleavoidance
)

### Generating Services

### Generating Module File
_generate_module_lisp(obstacleavoidance
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleavoidance
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(obstacleavoidance_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(obstacleavoidance_generate_messages obstacleavoidance_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleavoidance_generate_messages_lisp _obstacleavoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleavoidance_genlisp)
add_dependencies(obstacleavoidance_genlisp obstacleavoidance_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleavoidance_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(obstacleavoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleavoidance
)

### Generating Services

### Generating Module File
_generate_module_nodejs(obstacleavoidance
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleavoidance
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(obstacleavoidance_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(obstacleavoidance_generate_messages obstacleavoidance_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleavoidance_generate_messages_nodejs _obstacleavoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleavoidance_gennodejs)
add_dependencies(obstacleavoidance_gennodejs obstacleavoidance_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleavoidance_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(obstacleavoidance
  "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleavoidance
)

### Generating Services

### Generating Module File
_generate_module_py(obstacleavoidance
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleavoidance
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(obstacleavoidance_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(obstacleavoidance_generate_messages obstacleavoidance_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/sky/obstacle-avoidance/src/obstacle-avoidance/msg/Points.msg" NAME_WE)
add_dependencies(obstacleavoidance_generate_messages_py _obstacleavoidance_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(obstacleavoidance_genpy)
add_dependencies(obstacleavoidance_genpy obstacleavoidance_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS obstacleavoidance_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleavoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/obstacleavoidance
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(obstacleavoidance_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleavoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/obstacleavoidance
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(obstacleavoidance_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleavoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/obstacleavoidance
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(obstacleavoidance_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleavoidance)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/obstacleavoidance
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(obstacleavoidance_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleavoidance)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleavoidance\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/obstacleavoidance
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(obstacleavoidance_generate_messages_py geometry_msgs_generate_messages_py)
endif()
