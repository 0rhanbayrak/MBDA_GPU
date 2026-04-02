# Image Compression and MBDA GPU Framework

This repository combines two main components:

1. Image Compression Project using FFT and Tucker Decomposition  
2. GPU-enabled JupyterHub (MBDA Framework) using Docker  

---

## Part 1 — Image Compression with FFT and Tucker Decomposition

This project explores image compression and reconstruction using advanced tensor decomposition techniques. The objective is to compare:

- Spatial Tucker Decomposition  
- FFT-Tucker Decomposition (Fast Fourier Transform + Tucker)

---

### Key Highlights

- Memory-efficient image compression pipeline  
- FFT, Tucker decomposition, and GPU acceleration  
- Dataset of approximately 900 cat images  
- UMAP and SOM used for clustering (final cleaning done manually)  
- Custom GPU-enabled JupyterHub environment for experiments  

---

### Memory Size Comparison

| Stage | Approx. Size | Description |
|------|------:|-------------|
| Original dataset | ~342 MB | Raw images as float64 tensors |
| After RFFT | ~173 MB | Reduced spectrum using symmetry |
| After Tucker | ~3.3 MB | Core tensor + factor matrices |

---

### Results

- ~100× compression ratio  
- >99% reconstruction accuracy  
- Consistent performance improvement over comparable methods  
- Completed in 3.5 months  

---

### Methods

- Tucker Decomposition (core tensor + factor matrices)  
- FFT / RFFT (frequency-domain compression)  
- Mode-n unfolding and n-mode product  
- Visualization: error maps, PLS analysis, clustering  

---

### Future Work

- CP decomposition  
- Larger real-world datasets  
- Real-time compression systems  

---

### Acknowledgements

- Prof. Michael Sorochan Armstrong  
- José Camacho Páez  

Supported by:

- MuSTARD Project — PID2023-1523010B-IOO  
- Agencia Estatal de Investigación (Spain)  
- European Regional Development Fund  
- Horizon Europe (MAHOD) — 101106986  

---

### Development Context

Developed during an Erasmus+ internship at the Computational Data Science (CoDaS) Lab, University of Granada.

---

## Part 2 — Jupyter-based MBDA Framework with GPU Support

This section provides a Docker-based setup for a GPU-enabled JupyterHub environment configured for the MBDA framework.

---

### Maintainers

- Modified by: Orhan Bayrak  
- Original Author: José Camacho (josecamacho@ugr.es)  
- Last Modification: July 2025  

---

### Requirements

Ensure the following are installed:

- Docker Desktop (must remain running during all steps)  
- Git  
- NVIDIA GPU with CUDA 12.1+ (optional but recommended)  
- Internet connection (for initial build)  

---

### Installation

#### 1. Clone the repository

```bash
git clone https://github.com/0rhanbayrak/MBDA_GPU
cd MBDA_GPU
