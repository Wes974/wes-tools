# Use ubuntu 20.04 as base image
FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update apt
RUN apt-get -y update
# Install what's needed
RUN apt-get -y install build-essential gdb valgrind curl git-all zsh neovim

#####################
# Install my dotfiles
#####################

# Install oh-my-zsh and add some plugins
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Install powerlevel10k and build gitstatus
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && $HOME/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus/build -w -s

# Install node.js for coc.nvim
RUN curl -sL -O install-node.now.sh/lts && bash lts --yes # && rm lts
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; npm install -g neovim

#------------------------------------------#
# TODO: Replace dotfiles with files to ADD #
#------------------------------------------#
# Move config files
RUN git clone https://github.com/Wes974/dotfiles && cp -r dotfiles/nvim $HOME/.config/nvim && cp dotfiles/zshrc $HOME/.zshrc && cp dotfiles/p10k.zsh $HOME/.p10k.zsh

RUN nvim --headless +PlugInstall +qall

WORKDIR /home
