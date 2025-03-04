#!/bin/bash
# Install Robot Operating System (ROS) on NVIDIA Jetson TX2
# Maintainer of ARM builds for ROS is http://answers.ros.org/users/1034/ahendrix/
# Information from:
# http://wiki.ros.org/melodicic/Installation/UbuntuARM

# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# Installation
sudo apt-get update
sudo apt-get install ros-melodic-ros-base -y
# Add Individual Packages here
# You can install a specific ROS package (replace underscores with dashes of the package name):
# sudo apt-get install ros-kinetic-PACKAGE
# e.g.
# sudo apt-get install ros-melodic-navigation
sudo apt-get install -y ros-melodic-ackermann.msgs
sudo apt-get install -y ros-melodic-serial
sudo apt-get install -y ros-melodic-urdf
sudo apt-get install -y ros-melodic-robot-pose-ekf
sudo apt-get install -y ros-melodic-tf
sudo apt-get install -y ros-melodic-pcl-conversions
sudo apt-get install -y ros-melodic-hector-mapping
sudo apt-get install -y ros-melodic-gmapping
sudo apt-get install -y ros-melodic-image-transport
sudo apt-get install -y ros-melodic-rviz
sudo apt-get install -y ros-melodic-vision-opencv
sudo apt-get install -y ros-melodic-laser-scan-matcher
sudo apt-get install -y ros-melodic-joy-teleop
sudo apt-get install -y ros-melodic-joy
sudo apt-get install -y ros-melodic-urg-node
sudo apt-get install -y ros-melodic-razor-imu-9dof
sudo apt-get install -y ros-melodic-robot-state-publisher
sudo apt-get install -y ros-melodic-tf2-geometry-msgs
#
# To find available packages:
# apt-cache search ros-melodic
# 
# Initialize rosdep
sudo apt-get install python-rosdep -y
# Certificates are messed up on the Jetson for some reason
sudo c_rehash /etc/ssl/certs
# Initialize rosdep
sudo rosdep init
# To find available packages, use:
rosdep update
# Environment Setup - Don't add /opt/ros/kinetic/setup.bash if it's already in bashrc
grep -q -F 'source /opt/ros/melodic/setup.bash' ~/.bashrc || echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# Install rosinstall
sudo apt-get install python-rosinstall -y
#setup ROS environment variables
grep -q -F ' ROS_MASTER_URI' ~/.bashrc ||  echo 'export ROS_MASTER_URI=http://localhost:11311' | tee -a ~/.bashrc
grep -q -F ' ROS_IP' ~/.bashrc ||  echo "export ROS_IP=$(hostname -I)" | tee -a ~/.bashrc
# echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH" >> ~/.bashrc

