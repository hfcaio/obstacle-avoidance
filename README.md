# Initial setup

## clone directory
First, follow the instructions under [sky_sim](https://github.com/SKyrats/sky_sim).

Then, just clone this repository, by running the follow command:
```zsh
git clone --recursive git@github.com:hfcaio/obstacle-avoidance.git
```
 

## Build Instructions
Inside `obstacle-avoidance`, run `catkin build`:

```zsh
cd ~/obstacle-avoidance

catkin build
```

## running the Simulation Demo
To test the code in simulation we need 3 terminals:

### 1 terminal 
```zsh
sim_vehicle.py -v ArduCopter -f gazebo-iris
```

### 2 terminal

```zsh
cd ~/obstacle-avoidance

source devel/setup.bash

roslaunch obstacle_avoidance mission_sim.launch
```

After gazebo opens insert an object for the drone to avoid.

### 3 terminal
```zsh
cd ~/obstacle-avoidance

source devel/setup.bash

rosrun obstacle_avoidance mission.py
```
