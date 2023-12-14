# vimdev
Vim development environment for C/C++/Python/Go that runs in a docker container.


## Option 1a: Setup/Installation from source
1. Pull down Dockerfile and configurations

```sudo git clone https://github.com/bustanet/vimdev.git```

2. Build Image

```sudo docker build -t vimdev .```

3. Create programming projects directory (if you dont already have one)

```mkdir ~/my_projects```

4. Start container and mount your project directory

```sudo docker run -itd -p 5000:5000 --name vimdev -v ~/Github:/home/kali/Projects vimdev bash```

5. Access Container

```sudo docker exec -it vimdev bash``` 

## Option 1b: Download Pre-Compiled Container

## Starting a new Project (inside docker container)
1. Copy contents of boilerplate directory to your project directory and move there
```
cp -r ../vimdev/vim-cmake-boilerplate/* /root/my_projects/new_project
cd /root/my_projects/new_project
```

2. Build cmake environment for both Debug and Release builds AND create symbolic link of compiler flags in root directory (as required by ycm)
```
cd ./build/Debug
cmake -DCMAKE_BUILD_TYPE=Debug ../..
cd ../Release
cmake -DCMAKE_BUILD_TYPE=Release ../..
ln -s build/Debug/compile_commands.json compile_commands.json
```

4. Start vim from project root directory
```
cd /root/my_projects/new_project
vim
```

5. Set name of binary file to compile when pressing <F6> or <F7>
```:call SetBinaryRelease("Boilerplate") | call SetBinaryDebug("Boilerplate")```

6. Make changes to code (main.cpp or somethingelse)

7. Commands
```
<C-m>bd #Compile for debug
<C-m>br #build for release
<F6>	# Runs debug build
<F7>	# Runs release build
```
8. Other useful commands
```
<F2>	Toggle NERDTRee
<F8> 	Toggle Tabbar
```
## Other Settings 
1. If you dont already have ssh keys in your ~/.ssh directory, you'll need to create them, either on the host machine or from the docker container. 

```ssh-keygen -b 4096 -t rsa```

2. Configure git settings

```git config --global user.name "FIRST_NAME LAST_NAME"```

```git config --global user.email "MY_NAME@example.com"```



## Features
- YouCompleteMe
- etags
-

## Issues
I'm using a Macbook M1 and remoting into my dev environment. In order to get my color scheme to work with the following setup: 
iTerm --> tmux --> vim

I had to update .tmux.conf with:
```set -g default-terminal "xterm-256color"```

Force tmux  to assume terminal supports 256 colors 
```tmux -2```

## TODO
add git config instructions
make script to auto initialize the environment and drop you into vim
  - git config --global user.email "email"
  - git config --gloabl user.name "name"
add .gitignore to boilerplate


Cheat Sheet
cd ~
apt-get update
apt-get install pip
pip install powerline-status
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/bustanet/vimdev.git
cp vimdev/vimrc .vimrc

vim +PluginInstall +qall
#or
#:PluginInstall #from inside vim


# For YCM
apt install build-essential cmake vim-nox python3-dev
apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
python3 install.py --all --force-sudo
