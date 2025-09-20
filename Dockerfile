FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
		autoconf \
    apt-utils \
		build-essential \
		chrpath \
		cpio \
		diffstat \
		expect \
		fakeroot \
		gawk \
		gcc-multilib \
		gzip \
		libglib2.0-dev \
		libgtk2.0-0 \
		libgtk2.0-dev \
		libncurses5-dev \
		libsdl1.2-dev \
		libtinfo5 \
		libtool \
		libtool-bin \
		locales \
		lsb-release \
		make \
		pax \
		python3-gi \
		rsync \
		screen \
		socat \
		tar \
		xorg \
		xterm \
		xvfb \
		zlib1g-dev \
		zlib1g-dev \
	  bison \
	  flex \
	  gnupg \
	  libselinux1 \
	  libssl-dev \
	  texinfo \
	  tftpd \
	  unzip \
	  update-inetd \
	  wget

RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY image_files /home/$USERNAME/Downloads/image_files
RUN /home/$USERNAME/Downloads/image_files/xilinx_extracted_installer/installLibs.sh

WORKDIR /home/$USERNAME

RUN echo '#!/bin/bash\n' \
    'export _JAVA_AWT_WM_NONREPARENTING=1\n' \
    'exec /opt/Xilinx/2025.1/Vivado/bin/vivado "$@"\n' \
    > /usr/local/bin/vivado && chmod +x /usr/local/bin/vivado

RUN echo '#!/bin/bash\n' \
    'exec /opt/Xilinx/2025.1/Vitis/bin/vitis "$@"\n' \
    > /usr/local/bin/vitis && chmod +x /usr/local/bin/vitis

USER $USERNAME

CMD ["bash"]

