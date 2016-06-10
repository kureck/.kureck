curl -L http://install.ohmyz.sh | sh

git clone https://github.com/kureck/.kureck ~/.kureck

mv ~/.zshrc ~/.zshrc_bkp

mkdir ~/.kureck/.virtualenvs

ln -s ~/.kureck/.vim ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.kureck/.zshrc ~/.zshrc
ln -s ~/.kureck/.spacemacs ~/.spacemacs
ln -s ~/.kureck/.virtualenvs ~/.virtualenvs

cp ~/.kureck/to-oh-my-zsh/themes/ys_powerline.zsh-theme ~/.oh-my-zsh/themes
cp ~/.kureck/to-oh-my-zsh/functions/git.zsh ~/.oh-my-zsh/functions
cp -R ~/.kureck/to-oh-my-zsh/plugins/* ~/oh-my-zsh/plugins/

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#vim stuff: 
git clone https://github.com/mileszs/ack.vim ~/.kureck/.vim/bundle/ack.vim
git clone https://github.com/kien/ctrlp.vim.git ~/.kureck/.vim/bundle/ctrlp.vim
git clone https://github.com/easymotion/vim-easymotion ~/.kureck/.vim/bundle/vim-easymotion
git clone https://github.com/lenniboy/vim-scala ~/.kureck/.vim/bundle/scala.vim
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript

mkdir ~/.kureck/.vim/tmp
