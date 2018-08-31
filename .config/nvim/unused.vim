" https://github.com/zhranklin/init.vim/blob/master/files/.config/nvim/init.vim
"
" Supertab
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<tab>'

" UltiSnip
" <tab> => expand the snippets
let g:UltiSnipsExpandTrigger = '<tab>'
" <ctrl-s> => list available snippets start with the chars before the cursor
let g:UltiSnipsListSnippets = '<c-s>'
" <enter> => go to the next placeholder
let g:UltiSnipsJumpForwardTrigger = '<enter>'
" <shift-enter> => go to the previous placeholder
if exists('g:nyaovim_version')
  let g:UltiSnipsJumpBackwardTrigger = '<s-enter>'
else "as <shift-enter> can't be handled in terminal, use <ctrl-k> instead
  let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.scala = '[^. *\t]\.\w*\|: [A-Z]\w*'
