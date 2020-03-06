# Uses `ubuntu` image (not `rust`) because SiFive's compiled tools work on Ubuntu 14.04.
FROM rust:latest

WORKDIR /setup

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools installed
    && apt-get -y install git iproute2 procps \
    #
    # Install cross compiler toolchain for arm64
    && apt-get -y install g++-aarch64-linux-gnu \
    #
    # Install QEMU (user mode emulation distributed in binary)
    && apt-get -y install qemu-user-binfmt \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Add Rust's cross compilation target for arm64 and set it to default
RUN rustup target add aarch64-unknown-linux-gnu \
    & rustup override set 1.41.1-aarch64-unknown-linux-gnu

CMD ["bash"]
