# Jupyter-based MBDA Framework with GPU Support

This repository provides a Docker-based setup for a GPU-enabled JupyterHub environment configured for the MBDA framework.

---

## Maintainers

- **Modified by:** Orhan Bayrak  
- **Original Author:** José Camacho (josecamacho@ugr.es)  
- **Last Modification:** July 2025  

---

## Requirements

Before building or running this project, ensure the following components are installed and properly configured:

### Docker Desktop
- Must be installed and **running at all times** during:
  - Image build
  - Container execution
  - JupyterHub usage

### Git
- Required to clone this repository and fetch dependencies

### NVIDIA GPU + CUDA Drivers (Optional but Recommended)
- Required for GPU acceleration with PyTorch
- Ensure compatible CUDA drivers are installed (**CUDA 12.1+**)

### Internet Connection
- Required during the initial build to download dependencies

---

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/0rhanbayrak/MBDA_GPU
cd MBDA_GPU
