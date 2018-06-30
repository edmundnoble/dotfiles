function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin()

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'ajmwagar/vim-deus'

call plug#end()

let g:markdown_enable_spell_checking = 0
let g:markdown_enable_input_abbreviations = 0

let g:goyo_margin_top = 2
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 2

let @e="wywms?module}kO  , pa(..)'s"
let @f="ywms?module}kO  , pa's"

" colorscheme desert
filetype indent off

autocmd BufWritePre * %s/\s\+$//e

set nohlsearch
set rulerformat=%l,%c%V%=%P
set tabstop=2 shiftwidth=2 expandtab

colorscheme deus

