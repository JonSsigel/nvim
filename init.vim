set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'Badacadabra/vim-archery'
Plug 'sainnhe/edge' 
Plug 'saltdotac/citylights.vim'
Plug 'haishanh/night-owl.vim'
Plug 'rainglow/vim'
Plug 'vim-airline/vim-airline'
" iconos
Plug 'ryanoasis/vim-devicons'
" Cositas
Plug 'yggdroot/indentline' " para ver linea de todo un bloque identado
" typing
Plug 'jiangmiao/auto-pairs' " Autocompletar () {} []
" syntax
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
" Commentary
Plug 'tpope/vim-commentary'
"Esquema de colores
Plug 'kvrohit/rasmus.nvim'
Plug 'andersevenrud/nordic.nvim'
" If you are using Vim-Plug
Plug 'shaunsingh/nord.nvim'
Plug 'olivercederborg/poimandres.nvim'
"Plug 'catppuccin/nvim', {'as':'catppuccin'}
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
call plug#end()


"colorscheme edge
"colorscheme archery
"colorscheme moonfly
"Vim-Script:
"colorscheme nord "Este es muy bueno, revisar
" Vim Script
"colorscheme rasmus "Tercera opción
colorscheme poimandres "Segunda opcion

"colorscheme nordic

"colorscheme embark
"colorscheme nordic
"highlight Normal ctermbg=NONE
"colorscheme catppuccin
let mapleader=" "

" ################################ Configuracion default COC

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ################################ Comentado de momento por que no lo uso.
" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" ################################ Comentado de momento por que no lo uso.


" ################################ Configuracion default COC

set number " Agrega número línea
set title " Muestra el nombre del archivo en la ventana del terminal
set mouse=a " Permite la integración del mouse (seleccionar texto, mover el cursor)
set nowrap " No dividir la línea si es muy larga
set cursorline " Resalta la línea actual
set colorcolumn=128 " Muestra la columna límite a 120 caracteres
set ts=3 " tabulador en 2  
set shiftwidth=3 " tabulador con dos espacios
set smartcase " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
set ignorecase " Ignorar mayúsculas al hacer búsquedas
set relativenumber " Inserta números relativos
set encoding=UTF-8 "Acepta caracteres especiales como la ñ"
"set guifont=Hack\ 30 
"set guifont=DroidSansMono\ Nerd\ Font\ 11
" ################################ Configuracion NerdTree 
" Para abrir árbol de archivos

nnoremap <space>nt :NERDTreeFind<CR>
nmap <space>rs :vertical resize +12<CR>
nmap <space>rr :vertical resize -12<CR>
" ############################### Configuración tmux-navigator

nnoremap <space>h :TmuxNavigateLeft<cr>
nnoremap <space>l :TmuxNavigateRight<cr>
nnoremap <space>j :TmuxNavigateDown<cr>
nnoremap <space>k :TmuxNavigateUp<cr>

" ################################ Easymotion
"

nmap <space>s <Plug>(easymotion-s2)

"################## Personalizados
nmap <space>w :w<CR>
nmap <space>q :q<CR>
nmap <space>d :q!<CR>
nmap <space>g :wq<CR>

"################################ Fuzzy
nmap <space>f :Files<CR>
nmap <space>t :Ag<CR>
nmap <space>b :Buffer<CR>

"################################ Salto de 10 líneas.

nnoremap <silent> J 20j
nnoremap <silent> K 20k

"################################ Terminal
noremap <space>th :botright new <Bar> :terminal<cr>
"<Bar>:horizontal resize 12<cr>

"################################ copiar a portapapeles
noremap <space>cp "+y
noremap <space>pp "+p
" buscar una palabra
noremap <space>fw :/
" Cambiar a encoding latin1
noremap <space>fe :set fileencoding=ISO-8859-1<Enter>
" Dar formato a json
noremap <space>jf :%!jq .<CR>
