# Use ubuntu 20.04 as base image
FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update apt
RUN apt-get -y update
# Install what's needed
RUN apt-get -y install build-essential gdb valgrind curl git-all zsh neovim zsh-syntax-highlighting

#####################
# Install my dotfiles
#####################

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install node.js for coc.nvim
RUN curl -sL -O install-node.now.sh/lts && bash lts --yes # && rm lts

# Move config files
RUN git clone https://github.com/Wes974/dotfiles && mkdir $HOME/.config && mv dotfiles/nvim $HOME/.config/nvim && mv dotfiles/zshrc $HOME/.zshrc

WORKDIR /home
