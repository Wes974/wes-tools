# Use Arch Linux as base image.
FROM archlinux:latest

# Import dotfiles folder.
COPY ./dotfiles dotfiles

# Install what's needed.
RUN yes | pacman -Syuu; pacman -S --needed --noconfirm - < dotfiles/pkglist.txt

# Add non root user for running makepkg to install yay for installing some AUR packages.
RUN useradd non_root && mkdir /home/non_root && chown -R non_root:non_root /home/non_root && echo 'non_root ALL=NOPASSWD: ALL' >> /etc/sudoers
RUN sudo -u non_root bash -c 'cd ~ && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && yay -S --noconfirm criterion fff-git lcov'

# Install oh-my-zsh and some plugins + powerlevel10k and build gitstatus.
RUN cd ~ && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
       git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
       git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions && \
       git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
       $HOME/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus/build -w

# Install vim-plug + Neovim providers for Python and Node.
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; \
       npm install -g neovim && pip install -U wheel pynvim neovim

# Move config files and install Neovim plugins + workaround to install coc.nvim extensions
RUN cp -r dotfiles/nvim $HOME/.config/nvim && \
       cp dotfiles/zshrc $HOME/.zshrc && \
       cp dotfiles/p10k.zsh $HOME/.p10k.zsh && \
       nvim --headless +PlugInstall +qall
RUN timeout 2m nvim --headless +CocUpdateSync; exit 0

WORKDIR /home
