# Basis-Image: Jetson Linux 35.6.2 (JetPack 5.1.5)
FROM nvcr.io/nvidia/l4t-jetpack:r35.6.2

# Set non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# Update and install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      wget \
      libssl-dev \
      zlib1g-dev \
      libbz2-dev \
      libreadline-dev \
      libsqlite3-dev \
      libffi-dev \
      libncursesw5-dev \
      tk-dev \
      git && \
    rm -rf /var/lib/apt/lists/*

# Install Python 3.10 from source
ENV PYTHON_VERSION=3.10.12
WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar xzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd / && \
    rm -rf /tmp/Python-${PYTHON_VERSION}*

# Install Python ML dependencies
RUN pip3.10 install --no-cache-dir \
      numpy \
      scipy \
      pandas \
      pillow \
      opencv-python-headless \
      torch torchvision --extra-index-url https://download.pytorch.org/whl/jetson \
      tensorflow-aarch64 \
      onnxruntime \
      transformers \
      insightface \
      gfpgan \
      realesrgan

# Create app directory
WORKDIR /workspace
COPY . /workspace

# Default command
CMD ["/bin/bash"]
