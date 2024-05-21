#!/bin/bash

# Define the environment name
ENV_NAME=rgbd-3dgs-slam

# Ensure conda is initialized
eval "$(conda shell.bash hook)"

# Create the environment
conda create --name $ENV_NAME python=3.10 -y

# Activate the environment
conda activate $ENV_NAME

# Add necessary channels
conda config --env --add channels conda-forge
conda config --env --add channels robostack-staging
conda config --env --add channels defaults
conda config --env --add channels pytorch
conda config --env --add channels nvidia
conda config --env --remove channels defaults

# Install pip packages first
pip install torch torchvision torchaudio
pip install -U xformers --index-url https://download.pytorch.org/whl/cu121

# Install remaining pip packages
pip install matplotlib==3.5.3 platformdirs>=2.2.0 cython>=3.0.0 cython>=3.0.0 mako tqdm opencv-contrib-python munch trimesh plyfile evo==1.11.0 open3d torchmetrics imgviz PyOpenGL glfw PyGLM wandb lpips rich ruff appdirs attrs black blosc2 botocore certifi charset-normalizer click contourpy cycler docker-pycreds einops filelock flake8 flake8-bugbear flake8-comprehensions fonttools fsspec fvcore gitdb GitPython h5py huggingface-hub idna imageio imath iopath isort Jinja2 jmespath kiwisolver MarkupSafe mccabe mpmath msgpack mypy-extensions ndindex networkx ninja numexpr OpenEXR packaging pandas pathspec pillow>=9.3.0 platformdirs portalocker protobuf psutil py-cpuinfo pycodestyle pyflakes pyparsing python-dateutil pytz PyYAML requests safetensors scipy sentry-sdk setproctitle six smmap sympy tables tabulate termcolor timm typing_extensions tzdata urllib3 yacs

# Install conda packages
conda install -n $ENV_NAME ros-humble-desktop compilers cmake pkg-config make ninja colcon-common-extensions catkin_tools rosdep -y

# Install local editable packages
pip install -e ./MonoGS/submodules/diff-gaussian-rasterization
pip install -e ./MonoGS/submodules/simple-knn
pip install -e ./UniDepth

pip uninstall matplotlib -y
pip uninstall matplotlib -y
pip install matplotlib==3.5.3
pip uninstall pillow -y
pip uninstall pillow -y
pip install pillow>=9.3.0

# Print GPU name if available
python -c "
import torch
if torch.cuda.is_available():
    gpu_name = torch.cuda.get_device_name(0)
    print(f'GPU Name: {gpu_name}')
else:
    print('No GPU available')
"

echo "Environment setup complete and GPU check done."