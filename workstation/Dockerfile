FROM archlinux/base
MAINTAINER Jeff Langston (https://jefflangston.me)

# User with temporary password
RUN useradd -ms /bin/zsh jefflangston && \
    echo "root:12345678!" | chpasswd &&\
    echo "jefflangston:12345678!" | chpasswd && \
    echo "jefflangston ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman -Syyu --noconfirm
RUN pacman-db-upgrade
RUN pacman -S --noconfirm \
      awk \
      docker \
      docker-compose \
      fd \
      fzf \
      go \
      jq \
      httpie \
      lsd \
      mosh \
      mariadb \
      neovim \
      ncdu \
      python \
      python-pip \
      postgresql \
      ripgrep \
      rustup \
      tig \
      tmux \
      which \
      yarn

# install RVM
RUN gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -L get.rvm.io | bash -s stable


# GCP SDK
# RUN mkdir -p /home/jefflangston/dev/github
# RUN cd /home/jefflangston/dev/github

USER jefflangston
RUN curl -sSL https://sdk.cloud.google.com | bash; exit 0
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

RUN cd /home/jefflangston && \
    git clone https://github.com/jlangston/dotfiles

RUN cd /home/jefflangston && \
			 /home/jefflangston/dotfiles/linkdotfiles.sh

RUN pip install mycli pgcli --user

RUN curl -L https://github.com/rcoh/angle-grinder/releases/download/v0.9.0/angle_grinder-v0.9.0-x86_64-unknown-linux-musl.tar.gz \
    | tar Ozxf - \
    | sudo tee /usr/local/bin/agrind > /dev/null && sudo chmod +x /usr/local/bin/agrind

RUN pip install neovim && \
		gem install neovim && \
		nvim --headless +PlugInstall +qa &> /dev/null

RUN nvim --headless '+setf go' '+GoInstallBinaries' +qa &> /dev/null

RUN chsh -s /usr/bin/zsh

RUN mkdir /run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed 's/#Port 22/Port 3222/' -i /etc/ssh/sshd_config

ENV TERM screen-256color

EXPOSE 3222 60000-60010/udp

WORKDIR /home/jefflangston/

CMD [ "zsh" ]




