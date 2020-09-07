" Vim color file
" Converted from Textmate theme using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "hybrid"

hi Cursor ctermfg=234 ctermbg=62 cterm=NONE guifg=#1d1f21 guibg=#5842d6 gui=NONE
hi Visual ctermfg=NONE ctermbg=77 cterm=NONE guifg=NONE guibg=#4cd964 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2e3032 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2e3032 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#2e3032 gui=NONE
hi LineNr ctermfg=59 ctermbg=236 cterm=NONE guifg=#717474 guibg=#2e3032 gui=NONE
hi VertSplit ctermfg=239 ctermbg=239 cterm=NONE guifg=#4e5051 guibg=#4e5051 gui=NONE
hi MatchParen ctermfg=81 ctermbg=NONE cterm=underline guifg=#5ac8fa guibg=NONE gui=underline
hi StatusLine ctermfg=251 ctermbg=239 cterm=bold guifg=#c5c8c6 guibg=#4e5051 gui=bold
hi StatusLineNC ctermfg=251 ctermbg=239 cterm=NONE guifg=#c5c8c6 guibg=#4e5051 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=77 cterm=NONE guifg=NONE guibg=#4cd964 gui=NONE
hi IncSearch ctermfg=234 ctermbg=220 cterm=NONE guifg=#1d1f21 guibg=#ffcc00 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi Folded ctermfg=220 ctermbg=234 cterm=NONE guifg=#ffcc00 guibg=#1d1f21 gui=NONE

hi Normal ctermfg=251 ctermbg=234 cterm=NONE guifg=#c5c8c6 guibg=#1d1f21 gui=NONE
hi Boolean ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi Character ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi Comment ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi Conditional ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi Constant ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi Define ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi DiffAdd ctermfg=251 ctermbg=64 cterm=bold guifg=#c5c8c6 guibg=#44810b gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#890607 guibg=NONE gui=NONE
hi DiffChange ctermfg=251 ctermbg=23 cterm=NONE guifg=#c5c8c6 guibg=#1e3554 gui=NONE
hi DiffText ctermfg=251 ctermbg=24 cterm=bold guifg=#c5c8c6 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi Function ctermfg=62 ctermbg=NONE cterm=NONE guifg=#5842d6 guibg=NONE gui=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi Keyword ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi Label ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi NonText ctermfg=220 ctermbg=235 cterm=NONE guifg=#ffcc00 guibg=#252729 gui=NONE
hi Number ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi Operator ctermfg=62 ctermbg=NONE cterm=NONE guifg=#5842d6 guibg=NONE gui=NONE
hi PreProc ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi Special ctermfg=251 ctermbg=NONE cterm=NONE guifg=#c5c8c6 guibg=NONE gui=NONE
hi SpecialKey ctermfg=220 ctermbg=236 cterm=NONE guifg=#ffcc00 guibg=#2e3032 gui=NONE
hi Statement ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi String ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi Tag ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi Title ctermfg=251 ctermbg=NONE cterm=bold guifg=#c5c8c6 guibg=NONE gui=bold
hi Todo ctermfg=220 ctermbg=NONE cterm=inverse,bold guifg=#ffcc00 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi rubyFunction ctermfg=62 ctermbg=NONE cterm=NONE guifg=#5842d6 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi rubyConstant ctermfg=77 ctermbg=NONE cterm=NONE guifg=#4cd964 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi rubyInclude ctermfg=62 ctermbg=NONE cterm=NONE guifg=#5842d6 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi rubyEscape ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi rubyControl ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi rubyOperator ctermfg=62 ctermbg=NONE cterm=NONE guifg=#5842d6 guibg=NONE gui=NONE
hi rubyException ctermfg=62 ctermbg=NONE cterm=NONE guifg=#5842d6 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=77 ctermbg=NONE cterm=NONE guifg=#4cd964 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=188 ctermbg=NONE cterm=NONE guifg=#dbe0e0 guibg=NONE gui=NONE
hi erubyComment ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#5ac8fa guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi yamlAlias ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffcc00 guibg=NONE gui=NONE
hi cssURL ctermfg=59 ctermbg=NONE cterm=NONE guifg=#373b41 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi cssColor ctermfg=33 ctermbg=NONE cterm=NONE guifg=#007aff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi cssClassName ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi cssValueLength ctermfg=203 ctermbg=NONE cterm=NONE guifg=#ff3b30 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
