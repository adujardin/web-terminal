#sudo apt-get install cmake g++ pkg-config git vim-common libwebsockets-dev libjson-c-dev libssl-dev
#clone_folder="/tmp/ttyd"
#git clone https://github.com/tsl0922/ttyd.git ${clone_folder}
#cd ${clone_folder} && mkdir build && cd build
#cmake ..
#make && make install
#cd ../..
#rm -rf ${clone_folder}
wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -q -O ttyd
sudo mv ttyd /usr/local/bin/

sudo snap install tmux --classic

sudo cp training-supervisor.service /etc/systemd/system/
sudo systemctl start training-supervisor
sudo systemctl enable training-supervisor
