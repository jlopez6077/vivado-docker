# 2025.1 Vivado & Vitis Docker Environment

This project provides a **Docker-based environment** for running [Xilinx Vivado](https://www.xilinx.com/products/design-tools/vivado.html) and [Xilinx Vitis](https://www.xilinx.com/products/design-tools/vitis.html) on Linux systems, even when your host Distro is not officially supported (e.g., Arch Linux).

It includes:

- A `Dockerfile` for building a Ubuntu-based Xilinx toolchain container  
- Launcher scripts and `.desktop` entries for convenient access  
- Shared volumes to persist your workspace and Xilinx installations  

## Why? 
---

Initially, I managed to get Vivado running natively on **Arch Linux** by using a handful of unofficial hacks and workarounds.  
While it technically worked, it felt **fragile, unsupported, and time-consuming to maintain**.  

I realized it would be a **better long-term investment** of my time to containerize the tools with Docker.  
This way, I get:

- A **clean, reproducible environment** without breaking my host system  
- **Portability** — works across distros, not just Arch  
- Easier to share with others or replicate on different machines  

---

## 📂 Repository Structure
_ _ _
|-- Dockerfile&nbsp;&nbsp;# Defines the Xilinx Docker image
|-- image_files/&nbsp;# Supporting files (installer, scripts, assets, etc.)
|-- launchers/    &nbsp;# Launcher scripts and .desktop files for Vivado & Vitis
|-- xilinx_pkgs   &nbsp;# Script that starts the installation
|-- functions     &nbsp;# Bash functions
|-- .xilinx_pkgs_deprecated/ &nbsp;# Legacy/unused script (example of installing Xilinx toolchain directly on Arch)


---

## 🚀 Getting Started
---
### Download FPGAs_AdaptiveSoCs_Unified_SDI_2025.1_0530_0145_Lin64.bin
```bash
mv FPGAs_AdaptiveSoCs_Unified_SDI_2025 ~/Downloads/
./xilinx_pkgs
```
---
### 🖥️ Desktop Integration

.desktop files are included in launchers/ so you can start Vivado and Vitis
from your application launcher instead of the terminal.

### 📦 Volumes & Persistence

Workspace → Stored under ~/workspace on the host and mapped into the container
Xilinx installation → Mapped from /opt/Xilinx to allow reuse across container runs

### ⚠️ Disclaimer

This setup is an unofficial workaround to run Xilinx tools on unsupported distributions.
Use at your own risk. Always check the official AMD/Xilinx documentation
for supported environments.


### 📜 License

This repository is provided as-is under the MIT License.
Note: Xilinx Vivado and Vitis are proprietary software; you must supply your own installers/packages.

### References
[vivado-docker](https://github.com/filmil/vivado-docker)
---
