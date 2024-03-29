" This line makes pacman-installed global Arch Linux vim packages work.
source /usr/share/nvim/archlinux.vim

set number
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
syntax enable

call plug#begin(stdpath("config") . '/plugged')
	Plug 'ishan9299/nvim-solarized-lua'
	
	"Language Support
	"Plug 'fsharp/vim-fsharp'
	"
	"LSP Package Manager
	"Plug 'williamboman/mason.nvim'
	"Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
  	
	" cmp + function arguments 
	Plug 'ray-x/lsp_signature.nvim'

	" syntax highlighting 
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  	
	" This thing detects errors and puts them in a window, :ALE...
  	Plug 'dense-analysis/ale'

  	" tabnine
  	 Plug 'onsails/lspkind.nvim'
  	 Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

  	" statusline
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	
	" cmp 
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	" For vsnip users.
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

call plug#end()

colorscheme solarized-flat
set background=dark
set termguicolors

set completeopt=menu,menuone,noselect

nmap <silent> <C-x> <Plug>(ale_previous_wrap)
nmap <silent> <C-c> <Plug>(ale_next_wrap)

lua <<EOF 
	require("cmp_init")
	require("local_lualine")
	require("treesitter")
	require("lsp_kind")
	require("tabnine")
	require("lsp_conf")
	require("lsp_sig")
EOF 


let g:ale_virtualtext_cursor = 'disabled'
let g:ale_set_highlights = 0

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

autocmd BufNewFile,BufRead *.v :set filetype=vlang
autocmd CompleteDone * pclose!
