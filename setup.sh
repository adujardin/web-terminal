sudo apt-get install cmake g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev
clone_folder="/tmp/ttyd"
git clone https://github.com/tsl0922/ttyd.git ${clone_folder}
cd ${clone_folder} && mkdir build && cd build
cmake ..
make && make install
cd ../..
rm -rf ${clone_folder}

sudo snap install tmux --classic

systemctl enable training-supervisor.service