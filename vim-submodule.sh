#!bin/bash
#
## VIM IDE setup with Synstastic
# colorscheme
git submodule add https://github.com/altercation/vim-colors-solarized bundle/solarized
git submodule add https://github.com/bling/vim-airline bundle/airline
# source control integration
git submodule add https://github.com/tpope/vim-fugitive.git bundle/fugitive
git submodule add https://github.com/tpope/vim-git.git bundle/git
git submodule add https://github.com/airblade/vim-gitgutter bundle/gitgutter
# file management
git submodule add https://github.com/scrooloose/nerdtree bundle/nerdtree
git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
git submodule add https://github.com/wincent/command-t.git bundle/command-t
#git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
# writting code
git submodule add https://github.com/scrooloose/syntastic.git bundle/systastic
git submodule add https://github.com/tomtom/tlib_vim.git bundle/tlib
git submodule add https://github.com/MarcWeber/vim-addon-mw-utils.git bundle/mw-utils
git submodule add https://github.com/honza/vim-snippets.git bundle/snippets
git submodule add https://github.com/garbas/vim-snipmate.git bundle/snipmate
git submodule add https://github.com/tpope/vim-surround.git bundle/surround
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/junegunn/vim-easy-align bundle/easy-align
git submodule add https://github.com/godlygeek/tabular bundle/tabular
git submodule add https://github.com/bronson/vim-trailing-whitespace bundle/trailing-whitespace
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
# python
#git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
#git submodule add https://github.com/mitechie/pyflakes-pathogen.git
#git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
#git submodule add https://github.com/klen/python-mode bundle/python-mode
# others
git submodule add https://github.com/csexton/jekyll.vim bundle/jekyll
git submodule add https://github.com/gabrielelana/vim-markdown bundle/markdown
#git submodule add https://github.com/parkr/vim-jekyll bundle/jekyll
git submodule add https://github.com/vim-scripts/po.vim--Jelenak bundle/po
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
# update
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
