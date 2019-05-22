FROM archlinux:base
MAINTAINER Jeff Langston (https://jefflangston.me)

# User with temporary password
RUN adduser -s /bin/zsh -D jefflangston && \
    echo "root:12345678!" | chpasswd &&\
    echo "jefflangston:12345678!" | chpasswd && \
    echo "jefflangston ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman -Syu \
      docker \
      docker-compose \
      fd \
      fzf \
      go \
      jq \
      httpie \
      kubernetes-cli \
      mosh \
      mycli \
      neovim \
      ncdu \
      python \
      ripgrep \
      rustup \
      tig \
      tmux \
      yarn \

RUN curl -L get.rvm.io | bash

# RUN mkdir -p /home/jefflangston/dev/github/aur

# RUN cd /home/jefflangston/dev/github/aur

# RUN git clone https://github.com/jlangston/dotfiles

USER jefflangston

RUN cd /home/jefflangston && \
    git clone https://github.com/jlangston/dotfiles

RUN cd /home/jefflangston && \
			 /home/jefflangston/dotfiles/linkdotfiles.sh

RUN pip3 install neovim && \
		gem install neovim && \
		nvim --headless +PlugInstall +qa &> /dev/null

RUN nvim --headless '+setf go' '+GoInstallBinaries' +qa &> /dev/null

RUN chsh -s /usr/bin/zsh

EXPOSE 3222 60000-60010/udp

CMD [ "zsh" ]




