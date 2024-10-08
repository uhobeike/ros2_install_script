#/bin/bash -xve

sudo apt update -y && sudo apt install -y curl
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt upgrade -y

sudo apt install -y ros-humble-desktop ros-dev-tools
sudo apt -y install gazebo
sudo apt install -y ros-humble-gazebo-*

echo -e "\n## Execute ${BASH_SOURCE[0]} $(date +'%Y/%m/%d %H:%M:%S')"  >> ~/.bashrc

grep "source /opt/ros/humble/setup.bash" ~/.bashrc
if [ $? = 0 ]; then
  :
else
  echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
fi

grep "export ROS_DOMAIN_ID" ~/.bashrc
if [ $? = 0 ]; then
  :
else
  echo "export ROS_DOMAIN_ID=1" >> ~/.bashrc
fi

grep "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" ~/.bashrc
if [ $? = 0 ]; then
  :
else
  echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
fi

grep "export _colcon_cd_root=" ~/.bashrc
if [ $? = 0 ]; then
  :
else
  echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
  echo "export _colcon_cd_root=~" >> ~/.bashrc
fi
