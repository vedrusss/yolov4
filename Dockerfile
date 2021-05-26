# Start FROM Nvidia PyTorch image https://ngc.nvidia.com/catalog/containers/nvidia:pytorch
FROM nvcr.io/nvidia/pytorch:20.12-py3

# Install linux packages
RUN apt update && apt install -y zip htop screen libgl1-mesa-glx
RUN apt-get install -y libopencv-dev python-opencv

# Install python dependencies
RUN python -m pip install --upgrade pip
RUN pip install opencv-python
RUN pip install --no-cache coremltools onnx gsutil notebook

# Create working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Copy contents
COPY . /usr/src/app

# Set environment variables
ENV HOME=/usr/src/app
