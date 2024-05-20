# RGBD-3DGS-SLAM
RGBD-3DGS-SLAM is a monocular SLAM system leveraging 3D Gaussian Splatting (3DGS) for accurate point cloud and visual odometry estimation. By integrating neural networks, it estimates depth and camera intrinsics from RGB images alone, with optional support for additional camera information and depth maps. The system outputs high-quality Point Cloud and Visual Odometry, making it versatile for various robotic and computer vision applications.

<div align="center">
    <img src="assets/TUM_ROS.png" alt="SLAM" width="700"/>
    <p>MonoGS with UniDepthV2 and ROS 2</p>
</div>

## 🏁 Dependencies
1) PyTorch ([Official Link](https://pytorch.org/)).
2) MonoGS ([Official Link](https://github.com/muskie82/MonoGS)).
3) UniDepth ([Official Link](https://github.com/lpiccinelli-eth/UniDepth)).
4) RoboStack ROS 2 Humble ([Offical Link](https://robostack.github.io/GettingStarted.html)).

There is also enviroment.yml file, you can install or use as a reference using
```
conda env create -f environment.yml
```

## Downloading TUM dataset
```
cd MonoGS && bash scripts/download_tum.sh
```

## ⌛️ Running SLAM
### TUM office
You can run the system on the TUM dataset using the same method from the [original repository](https://github.com/muskie82/MonoGS).

#### Monocular mode
```
python slam.py --config configs/mono/tum/fr3_office.yaml
```
