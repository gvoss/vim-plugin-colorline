" Color Line - gvoss

" default color variables
if !exists("g:color_line_bg_cterm_default")
  let g:color_line_bg_cterm_default = '237'
endif
if !exists("g:color_line_bg_gui_default")
  let g:color_line_bg_gui_default = '#3c3d37'
endif
" red color variables
if !exists("g:color_line_bg_cterm_red")
  let g:color_line_bg_cterm_red = '52'
endif
if !exists("g:color_line_bg_gui_red")
  let g:color_line_bg_gui_red = '#865142'
endif
" green color variables
if !exists("g:color_line_bg_cterm_green")
  let g:color_line_bg_cterm_green = '22'
endif
if !exists("g:color_line_bg_gui_green")
  let g:color_line_bg_gui_green = '#2F5E45'
endif

" function to set color based on insert mode(s)
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    exe 'hi CursorLine cterm=NONE ctermbg='.g:color_line_bg_cterm_green.' guibg='.g:color_line_bg_gui_green
  elseif a:mode == 'r' || a:mode == 'v'
    exe 'hi CursorLine cterm=NONE ctermbg='.g:color_line_bg_cterm_red.' guibg='.g:color_line_bg_gui_red
  else
    exe 'hi CursorLine cterm=NONE ctermbg='.g:color_line_bg_cterm_default.' guibg='.g:color_line_bg_gui_default
  endif
endfunction

" function to set color back to default
function! DefaultStatusLineColor()
    exe 'hi CursorLine cterm=NONE ctermbg='.g:color_line_bg_cterm_default.' guibg='.g:color_line_bg_gui_default
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call DefaultStatusLineColor()
