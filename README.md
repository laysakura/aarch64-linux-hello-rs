# aarch64-linux-hello-rs

A "Hellow World!" written in Rust, compiled into runnable binary for arm64 (aarch64) archtecture on Linux.

## Features

- **Works in docker.** No need to insall compilers, linkers, and simulators by yourself.
- Compiled into **arm64 (aarch64) with Linux GNU ABI.**
- Uses **stable rustc build.** Not nightly.
- Uses cargo. Not xargo.
- (Optional) Runs with Visual Studio Code Remote Development Container.

## Run in Docker

### In your host machine:

```bash
docker build --rm -t aarch64-linux-hello-rs .
docker run -it --rm --volume ${PWD}:/source --workdir /source aarch64-linux-hello-rs
```

### In the docker image:

`Ctrl-a x` to quit QEMU monitor.

```bash
root@9da32352d17d:/workspaces/aarch64-linux-hello-rs# cargo run
    Finished dev [unoptimized + debuginfo] target(s) in 0.02s
     Running `qemu-aarch64 -L /usr/aarch64-linux-gnu/ target/aarch64-unknown-linux-gnu/debug/aarch64-linux-hello-rs`
Hello from Rust!
```

## (Optional) Run with Visual Studio Code Remote Development Container

Open Visual Studio code with:

```bash
code .
```

And select the `Remote-Containers: Add Development Container Configuration Files...` command from the Command Palette (F1) and pick a pre-defined container configuration file.
