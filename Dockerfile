FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

# Sistem paketleri
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev python3-distutils python-is-python3 \
    git curl sudo npm nodejs octave

# pip güncelle
RUN python3 -m pip install --upgrade pip

# 🔧 Proxy için eski stil node destekli 'configurable-http-proxy'
RUN npm install -g configurable-http-proxy@4.5.0

# PyTorch (CUDA 12.1 destekli)
RUN python3 -m pip install \
    torch==2.2.2+cu121 torchvision==0.17.2+cu121 torchaudio==2.2.2 \
    --index-url https://download.pytorch.org/whl/cu121

# Jupyter ortamı ve diğer bağımlılıklar
RUN python3 -m pip install --no-cache-dir \
    jupyterhub notebook jupyterlab \
    git+https://github.com/jupyterhub/nativeauthenticator \
    dockerspawner octave-kernel jupyterhub-idle-culler \
    IPy PyYAML

# Proje araçlarını klonla
RUN git clone https://github.com/josecamachop/FCParser && \
    git clone https://github.com/josecamachop/MEDA-Toolbox --branch v1.3

# JupyterHub config
WORKDIR /etc/jupyterhub
COPY home /home
RUN ln -s /home/jupyterhub_config.py jupyterhub_config.py

# Başlat
ENTRYPOINT ["jupyterhub", "-f", "/etc/jupyterhub/jupyterhub_config.py"]
