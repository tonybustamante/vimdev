FROM ubuntu 


RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y --no-install-recommends tzdata
RUN apt-get update && apt-get install -y curl git vim-nox pip fonts-powerline wget ctags sqlite3
RUN python3 -m pip install powerline-status psutil i3ipc virtualenv

# Download Vundle package manager
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Pull down our custom vimrc 
COPY vimrc /root/.vimrc
COPY tmux.conf /root/.tmux.conf

# RUN [ /bin/bash, -c, vim -E -s -c source ~/.vimrc -c PluginInstall -c qa  ]
# RUN vim -E -s -c source /home/tony/.vimrc  -c PluginInstall -c qa

RUN vim +PluginInstall +qall
# RUN sed -i 's/\" colorscheme/colorscheme/' /root/.vimrc

# YouCompleteMe dependencies
RUN apt-get update && apt-get install -y \
    build-essential \ 
    cmake \
    python3-dev \
    mono-complete \
    golang \
    nodejs \
    default-jdk \
    npm

# Compile YouCompleteMe
RUN python3 ~/.vim/bundle/YouCompleteMe/install.py --all

ADD vim-cmake-boilerplate /root/vim-cmake-boilerplate

