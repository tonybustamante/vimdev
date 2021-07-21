# vimdev
Vim development environment for C/C++/Python/Go that runs in a docker container.

## Setup/Installation
1. Pull down Dockerfile and configurations

```sudo git clone https://github.com/bustanet/vimdev.git```

2. Build Image

```sudo docker build --t vimdev .```

3. Create programming projects directory (if you dont already have one)

```mkdir ~/my_projects```

4. Start container and mount your project directory

```sudo docker run -it --name vimdev -v ~/my_projects:/root/my_projects vimdev bash```

## Workflow (inside docker container)
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
add .gitignore to boilerplate
