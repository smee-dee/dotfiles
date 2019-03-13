" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-09-17.
" @Last Change: 2019-02-19.
" @Revision:    34

if exists(':Tlibtrace') != 2
    command! -nargs=+ -bang Tlibtrace :
endif


if !exists('g:tcomment#syntax#substitute')
    " Perform replacements on the syntax name. This can be used to 
    " streamline inconsistent syntax names or to map a syntax name onto 
    " a differen filetype.
    " :read: let g:tcomment#syntax#substitute = {RX: {'sub': SUBST} ...}   "{{{2
    let g:tcomment#syntax#substitute = {
                \ '\C^javaScript\ze\(\u\|$\)': {'sub': 'javascript'},
                \ '\C^js\ze\(\u\|$\)': {'sub': 'javascript'}
                \ }
endif


if !exists('g:tcomment#syntax#substitute_by_filetype')
    " Extend |g:tcomment#syntax#substitute| if FILETYPE_RX matches the 
    " current filetype.
    " let g:tcomment#syntax#substitute_by_filetype = {FILETYPE_RX: SUBSTITUTE_DEF ...}   "{{{2
    let g:tcomment#syntax#substitute_by_filetype = {
                \ '^\(java\|type\)script\.[jt]sx$': {
                \         '\C^xmlTag': {'sub': 'jsx'},
                \         '\C^xmlAttrib': {'sub': 'javascript'}}
                \ }
endif


function! tcomment#syntax#GetSyntaxName(lnum, col, ...) abort "{{{3
    let tran = a:0 >= 1 ? a:1 : 1
    let cdef = a:0 >= 2 ? a:2 : {}
    let filetype = get(cdef, 'filetype', &filetype)
    let syntax_name = synIDattr(synID(a:lnum, a:col, tran), 'name')
    Tlibtrace 'tcomment', a:lnum, a:col, tran, cdef, syntax_name
    let subs = copy(g:tcomment#syntax#substitute)
    for [ft_rx, sdef] in items(g:tcomment#syntax#substitute_by_filetype)
        if filetype =~ ft_rx
            let subs = extend(subs, sdef)
        endif
    endfor
    Tlibtrace 'tcomment', keys(subs)
    if !empty(subs)
        for [rx, subdef] in items(subs)
            if !has_key(subdef, 'if') || eval(subdef.if)
                let syntax_name = substitute(syntax_name, rx, subdef.sub, 'g')
            endif
        endfor
    endif
    Tlibtrace 'tcomment', syntax_name
    return syntax_name
endf

