# Use this Arch Linux base image to be multiarch
FROM lopsided/archlinux:latest

# Import dotfiles folder.
COPY ./dotfiles dotfiles

# Install what's needed.
RUN pacman -Syuu --needed --noconfirm - < dotfiles/pkglist.txt && \
       find /. -name "*~" -type f -delete && \
       pacman -Sc && \
       rm -r /var/lib/pacman/sync/*

# Manual install of Criterion and bison-epita
# RUN wget https://www.lrde.epita.fr/\~tiger/download/bison-3.2.1.52-cd4f7.tar.gz && tar -xvf bison-3.2.1.52-cd4f7.tar.gz && cd bison-3.2.1.52-cd4f7 && \
#        ./configure && make && make install && cd .. && rm -rf bison-3.2.1.52-cd4f7 && rm bison-3.2.1.52-cd4f7.tar.gz && \
#        # Dependency for Criterion
#        git clone https://github.com/Snaipe/libcsptr.git && cd libcsptr && mkdir build && cd $_ && cmake -DCMAKE_INSTALL_PREFIX=/usr .. && \
#        make && make install && cd ../.. && rm -rf libcsptr && \
#        # Install Criterion
#        git clone --recursive https://github.com/Snaipe/Criterion && cd Criterion && \
#        meson build && ninja -C build install && cd .. && rm -rf Criterion

# TODO: Replace with new neovim config
# Install oh-my-zsh and some plugins + powerlevel10k and build gitstatus.
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
       git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
       git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions && \
       git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
       $HOME/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus/build -w && \
       # Install vim-plug + Neovim providers for Python and Node.
       sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; \
       npm install -g neovim && pip install -U pynvim neovim scan-build && \
       # Move my dotfiles for Neovim and Zsh to the appropriate places.
       mkdir -p $HOME/.config && \
       cp -r /dotfiles/nvim $HOME/.config/nvim && cp /dotfiles/zshrc $HOME/.zshrc && \
       cp /dotfiles/p10k.zsh $HOME/.p10k.zsh && cp /dotfiles/clang-format /.clang-format && \
       # Install vim plugins via workaround.
       nvim --headless +PlugInstall +qall && \
       nvim --headless -c 'CocInstall -sync coc-snippets coc-pairs coc-actions coc-lists coc-highlight coc-python coc-clangd coc-sh|q' +qall && \
       rm -rf dotfiles && \
       npm cache clean --force && pip cache purge

WORKDIR /home
CMD [ "/bin/zsh" ]