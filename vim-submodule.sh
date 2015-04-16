#!bin/bash
#
## VIM IDE setup with Synstastic
# colorscheme
git submodule add https://github.com/altercation/vim-colors-solarized ~/.vim/bundle/solarized
git submodule add https://github.com/bling/vim-airline ~/.vim/bundle/airline
# source control integration
git submodule add https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive
git submodule add https://github.com/tpope/vim-git.git ~/.vim/bundle/git
git submodule add https://github.com/airblade/vim-gitgutter ~/.vim/bundle/gitgutter
# file management
git submodule add https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
git submodule add https://github.com/fholgado/minibufexpl.vim.git ~/.vim/bundle/minibufexpl
git submodule add https://github.com/wincent/command-t.git ~/.vim/bundle/command-t
#git submodule add https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack
# writting code
git submodule add https://github.com/scrooloose/syntastic.git ~/.vim/bundle/systastic
git submodule add https://github.com/tomtom/tlib_vim.git ~/.vim/bundle/tlib
git submodule add https://github.com/MarcWeber/vim-addon-mw-utils.git ~/.vim/bundle/mw-utils
git submodule add https://github.com/honza/vim-snippets.git ~/.vim/bundle/snippets
git submodule add https://github.com/garbas/vim-snipmate.git ~/.vim/bundle/snipmate
git submodule add https://github.com/tpope/vim-surround.git ~/.vim/bundle/surround
git submodule add https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
git submodule add https://github.com/junegunn/vim-easy-align ~/.vim/bundle/easy-align
git submodule add https://github.com/godlygeek/tabular ~/.vim/bundle/tabular
git submodule add https://github.com/bronson/vim-trailing-whitespace ~/.vim/bundle/trailing-whitespace
git submodule add https://github.com/sjl/gundo.vim.git ~/.vim/bundle/gundo
git submodule add https://github.com/reinh/vim-makegreen ~/.vim/bundle/makegreen
# python
#git submodule add https://github.com/fs111/pydoc.vim.git ~/.vim/bundle/pydoc
#git submodule add https://github.com/mitechie/pyflakes-pathogen.git ~/.vim/bundle/pyflakes
#git submodule add https://github.com/alfredodeza/pytest.vim.git ~/.vim/bundle/py.test
#git submodule add https://github.com/klen/python-mode ~/.vim/bundle/python-mode
# others
git submodule add https://github.com/csexton/jekyll.vim ~/.vim/bundle/jekyll
git submodule add https://github.com/gabrielelana/vim-markdown ~/.vim/bundle/markdown
#git submodule add https://github.com/parkr/vim-jekyll ~/.vim/bundle/jekyll
git submodule add https://github.com/vim-scripts/po.vim--Jelenak ~/.vim/bundle/po
git submodule add https://github.com/vim-scripts/TaskList.vim.git ~/.vim/bundle/tasklist
# update
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
