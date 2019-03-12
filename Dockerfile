FROM alpine:edge
MAINTAINER Jeff Langston (https://jefflangston.me)

# User with temporary password
RUN adduser -s /bin/zsh -D jefflangston && \
    echo "root:12345678!" | chpasswd &&\
    echo "jefflangston:12345678!" | chpasswd && \
    echo "jefflangston ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Add alpine edge [ main, community, testing ]
RUN echo -e \
    'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' \
    > /etc/apk/repositories

# base
RUN apk add --update-cache \
    linux-headers alpine-sdk build-base cmake
RUN apk add bash build-base curl file git gzip libc6-compat python-dev ncurses ruby ruby-dbm ruby-etc ruby-irb ruby-json sudo zsh

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
	  && useradd -m -s /bin/bash linuxbrew \
	  && echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

USER linuxbrew


ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH \
  	SHELL=/bin/bash \
  	USER=linuxbrew

WORKDIR /home/linuxbrew

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

ENV PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH

RUN brew install chuby docker docker-compose fzf go htop httpie kubernetes-cli mosh mycli ndovim python ripgrep tig tmux yarn zplug

USER jefflangston

RUN cd /home/jefflangston && \
    git clone https://github.com/jlangston/dotfiles

RUN cd /home/jefflangston && \
			 /home/jefflangston/dotfiles/linkdotfiles.sh

RUN pip3 install neovim && \
		gem install neovim && \
		nvim --headless +PlugInstall +qa &> /dev/null

RUN nvim --headless '+setf go' '+GoInstallBinaries' +qa &> /dev/null

CMD [ "zsh" ]




