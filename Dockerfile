ARG GIT_USERNAME="Ihor Kopyl"

FROM ubuntu AS neovim_ide

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

RUN apt-get update && apt install -y software-properties-common zsh

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8


RUN add-apt-repository ppa:neovim-ppa/unstable

RUN apt-get update && apt install -y neovim tmux git curl wget tzdata php8.1-cli unzip gzip tar zsh nodejs npm
RUN apt install -y exuberant-ctags
# RUN apt-get update && apt install -y tmux git curl wget tzdata php8.1-cli unzip gzip tar zsh nodejs npm

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet && mv composer.phar /usr/local/bin/composer

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN npm install -g neovim
RUN git config --global user.name "Ihor Kopyl"

ENV LANG en_US.utf8

LABEL key="value"

WORKDIR /root/.config/