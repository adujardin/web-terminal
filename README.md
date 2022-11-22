# Training supervisor

<p align="center">
    <a href="preview/video_preview.mp4">
    <img src="preview/gif_readme.gif", width="800">
    </a>
</p>

Heavily compressed gif preview in operation, [full video here](preview/video_preview.mp4).

The 2 clients have full control over the server and are sending commands on the same terminal while beeing on separate machines on the same network.

## Use case

- Control a server from a web browser with full uninterruptible bash terminal

### How it's done

-> Start a process and connect from a browser to a *unique* bash using [ttyd](https://github.com/tsl0922/ttyd) and `tmux`.
Every client connects to the **same** bash (it support authentication). This means anybody can watch and control simultaneously the same process/terminal (with the output)

## Setup (server side)

### Steps

No setup required on the client-side, only on the training server :

1. Install from source ttyd

```bash
sudo apt-get install cmake g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev
git clone https://github.com/tsl0922/ttyd.git
cd ttyd && mkdir build && cd build
cmake ..
make && sudo make install
```

2. Install tmux

```bash
sudo snap install tmux --classic
```

3. Start (manually or automatically at boot) :

```bash
TTYD_PORT=4563
TTYD_USER="user"
TTYD_PASSWD="passwd"
TTYD_CMD="login" # can also be 'bash' or whatever command

sudo ttyd -T xterm -p ${TTYD_PORT} -c ${TTYD_USER}:${TTYD_PASSWD} tmux new -A -s ttyd ${TTYD_CMD}
```

The authentication is optional but recommended.

### Setup script

Alternatively the [setup.sh](setup.sh) script can be used to install the required dependencies and register a systemd service to start at boot. I recommend updating [the service file](training-supervisor.service) before setting it up since the user, password, and port are hardcoded as an example.

## Usage

On the client(s) open a browser to the machine IP or name like: `http://training-server-name:4563/`

Enter the authentication if needed (the first time) and that's it!
