pointgrey_camera_driver
=======================

[![Build Status](https://travis-ci.org/ros-drivers/pointgrey_camera_driver.png?branch=master)](https://travis-ci.org/ros-drivers/pointgrey_camera_driver)


This repo is compatible with armv8 architecture devices, but only tested on jetson tx2.

Due to the update of the device website, the URL in python script has expired, so I blocked some code of downloading device and directly access the local 64-bit armv8 driver at compile time.

You can download the last pointgrep camera drive [here](https://flir.app.boxcn.net/v/Flycapture2SDK) and modify the `pointgrey_camera_driver/cmake/download_flycap` and `pointgrey_camera_driver/cmake/DownloadFlyCap.cmake` to be compatible with your device.


## Installation steps for Jeston TX2:

Environment: Ubuntu 16.04 + ROS kinetic

- Clone the repository and compile with catkin_make
```
ws=[your_catkin_ws]
cd $ws/src
git clone https://github.com/Xue-JW/pointgrey_camera_driver.git
cd ../ && catkin_make

```

- Set USB permissions:
```
cd $ws/build/pointgrey_camera_driver/usr

sudo chmod +x flycap2-conf

sudo sh flycap2-conf
```
- Set usb buffer size and USB3.0 mode:
```
run `sudo gedit /boot/extlinux/extlinux.conf`

add `usbcore.usbfs_memory_mb=1024` and `usb_port_owner_info=2` at the end of the "APPEND" line
```
- Reboot TX2 with `sudo reboot`

- Check buffer size after reboot with `cat /sys/module/usbcore/parameters/usbfs_memory_mb`

- Use `rosrun pointgrey_camera_driver list_cameras` to get camera info

- Run `roslaunch pointgrey_camera_driver camera.launch` and check camera data by rqt or `rostopic hz /camera/image_raw`

If step 3 not work, check [here](https://devtalk.nvidia.com/default/topic/1049581/jetson-agx-xavier/change-usbcore-usbfs_memory_mb-solved-/)

## Ref:
- https://blog.csdn.net/QFJIZHI/article/details/82896355
- https://blog.csdn.net/qq_34254510/article/details/80261980
- https://www.cnblogs.com/renqiangnwpu/p/9142085.html
- https://devtalk.nvidia.com/default/topic/1049581/jetson-agx-xavier/change-usbcore-usbfs_memory_mb-solved-/

----
ROS-compatible Camera drivers originally provided by NREC, part of Carnegie Mellon University's robotics institute.
These drives are included along with modifications of the standard ros image messages that enable HDR and physics based vision.

This code was originally developed by the National Robotics Engineering Center (NREC), part of the Robotics Institute at Carnegie Mellon University. Its development was funded by DARPA under the LS3 program and submitted for public release on June 7th, 2012. Release was granted on August, 21st 2012 with Distribution Statement "A" (Approved for Public Release, Distribution Unlimited).

This software is released under a BSD license:

Copyright (c) 2012, Carnegie Mellon University. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of the Carnegie Mellon University nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

