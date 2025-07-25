FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04
# System Packages
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev python3-distutils python-is-python3 \
    git curl sudo npm nodejs octave

# Update pip
RUN python3 -m pip install --upgrade pip

# Old style node supported 'configurable-http proxy' for proxy
RUN npm install -g configurable-http-proxy@4.5.0

# PyTorch (Supports CUDA 12.1)
RUN python3 -m pip install \
    torch==2.2.2+cu121 torchvision==0.17.2+cu121 torchaudio==2.2.2 \
    --index-url https://download.pytorch.org/whl/cu121

# Jupyter environment and other dependencies
RUN python3 -m pip install --no-cache-dir \
    jupyterhub notebook jupyterlab \
    git+https://github.com/jupyterhub/nativeauthenticator \
    dockerspawner octave-kernel jupyterhub-idle-culler \
    IPy PyYAML

# Clone project tools
RUN git clone https://github.com/josecamachop/FCParser && \
    git clone https://github.com/josecamachop/MEDA-Toolbox --branch v1.3

# JupyterHub config
WORKDIR /etc/jupyterhub
COPY home /home
RUN ln -s /home/jupyterhub_config.py jupyterhub_config.py
# Start
ENTRYPOINT ["jupyterhub", "-f", "/etc/jupyterhub/jupyterhub_config.py"]
