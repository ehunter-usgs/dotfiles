" More Useful
set nocompatible
set backspace=indent,eol,start
set autoindent
set tw=80

set clipboard=unnamed
set wildmenu
set ttyfast
set encoding=utf-8 nobomb

" Respect other developers' modelines
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands
set exrc
set secure

" Enable line numbers
set number

" Coloring
syntax on
hi StatusLine ctermbg=0 ctermfg=8
hi NonText ctermfg=8
hi MatchParen ctermbg=9
hi IncSearch ctermfg=5
hi LineNr ctermfg=1
hi SpecialKey ctermfg=8

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Show “invisible” characters
set lcs=tab:→\ ,trail:·,eol:¬,nbsp:_
set list

" Search as you type
set incsearch

" Be quiet
set noerrorbells

set nostartofline
set ruler
set title

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Status bar
set laststatus=2
set statusline=%t\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %r%=%c,%l/%L\ %p%%

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" --- Custom UDF Stuff --- "

" Change mapleader
let mapleader=","

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

endif


function! LoadTemplate()
  silent! 0r ~/.vim/skel/templ.%:e
  " Highlight %VAR% placeholders with TODO color group
  syn match Todo "%\u\+%" containedIn=ALL
endfunction

autocmd! BufNewFile * call LoadTemplate()

nmap <silent> <F2> :set list!<CR>

ab chglog <ESC>:r !date +\%m-%d-%y<CR>kJA -- EMM:

" Some lorem ipsum texts
ab loremclassic Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sollicitudin venenatis laoreet. Nulla et magna et turpis sollicitudin sagittis a sit amet neque. Pellentesque malesuada condimentum elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam erat volutpat. Etiam cursus convallis sem, vitae tristique nulla pellentesque sed. Integer eu ultrices erat. Aliquam erat volutpat. Aliquam non mollis purus. Curabitur nunc purus, tempor sed volutpat sed, dapibus in lectus. Proin rhoncus convallis augue, ut dignissim ligula fringilla et.

ab lorembeer wheat beer glass dunkle; ale fermentation anaerobic ipa. primary fermentation final gravity, chocolate malt dextrin. additive specific gravity; kolsch ipa, " hefe." bung infusion, " becher dunkle original gravity attenuation hydrometer." goblet mead, copper crystal malt sour/acidic copper, barleywine bunghole.

ab lorembacon Bacon ipsum dolor sit amet ribeye spare ribs drumstick brisket. Brisket pork short ribs swine ham meatball. Meatball short ribs strip steak boudin. Rump strip steak tongue, chuck beef ribs kielbasa chicken sausage filet mignon fatback turkey drumstick boudin pork belly. Cow tail ham swine, drumstick corned beef jerky t-bone frankfurter pancetta pastrami ball tip.

ab loremcupcake Cotton candy tiramisu macaroon sweet roll croissant faworki chupa chups. Gingerbread wypas candy canes sugar plum jelly-o gummi bears cotton candy. Sweet pie toffee jelly-o cheesecake dessert. Icing jujubes halvah soufflé gummi bears gummies. Sweet apple pie gummi bears danish lollipop. Marshmallow tootsie roll tiramisu cookie liquorice bear claw jelly beans. Gummies biscuit liquorice dragée jelly beans topping cake. Dessert pastry candy jelly-o lemon drops jelly. Cake wafer wafer candy canes powder apple pie soufflé brownie chocolate cake. Gummi bears powder pie candy jujubes. Caramels gummi bears icing tootsie roll. Croissant wafer apple pie sugar plum. Pie cupcake lemon drops pudding chocolate cake donut gummies pie. Chocolate cheesecake candy croissant.
