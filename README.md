# Spot container

For questions regarding setting up Spot, please also refer to the [AMR wiki](https://github.com/tud-amr/wiki).

## Start the docker container
#### 1. Building Docker image
Clone the repository:
```
git clone --recurse-submodules git@github.com:bsygo/spot_container.git
cd spot_container
git submodule update --init --recursive --remote
```
If using an arm64 setup, remove the comment for the flag in line 67 of the Dockerfile.

Navigate to the workspace and run the build script.
```
./docker_build.sh
```
This will build a Ubuntu 22.04 image (ROS2 Humble) and copy the `spot_driver` inside the container. It will be placed in the `externals` directory, which is accessible within the container only.

After building the container, execute the `run` script, then build and source the workspace:
```
./docker_run
```
```
colcon build
source install/setup.bash
```
This will start the container and mount the `spot_container/src/packages` directory in it. `packages` contains an example launch script and walking node.

#### 2. Launching `spot_driver`
To start the Spot driver, the following environment variables must be defined:
See the AMR wiki for details (involves login credentials).

The following launch file will launch the `spot_driver`:
```
ros2 launch spot_nav spot_driver.launch.py
```
`spot_nav_node` is a node that allows sending the Spot robot relative waypoints. Running the following command will send a `walk forward` command to the Spot robot, causing it to walk forward 1 meter:
```
ros2 run spot_nav spot_nav_node
```

## Overview
The image uses a Ubuntu 22.04 base image with ROS2 Humble installed.

### Teltonika setup
The RUTC50 is used to establish a connection between Spot, the installed RPi, and the user.
For the existing configuration, the RUTC50 has the following credentials:

**Wireless interfaces:**
See the AMR wiki entry on Spot for credentials.

##### Spot
Spot's assigned static IP needs to match the one used with the `spot_driver`; it is set to `192.168.10.102`.
