let s:theme = 'superdark'

let s:want_showmod = get(g:, 'airline_superdark_showmod', 0)

function! airline#themes#{s:theme}#refresh()
    if &background == "dark"
        " Normal
        " let N1 = [ '#75715F', '#2D2E27', 254, 237 ]
        let N1 = [ '#e8e8e8', '#373832', 254, 237 ]
        " let N3 = [ '#e8e8e8', '#373832', 255, 235 ]
        let N3 = [ '#75715f', '#2D2E27', 255, 235 ]
        let N2 = N1

        " Inactive
        let IA = [ '#75715f', N3[1], 242, N3[3] ]

        " Error
        let ER = N3

        " Warning
        let WI = N3
    endif

    " Terminal
    let TE = [ ER[0], N1[1], N1[2], N1[3] ]

    " Reverse
    let NR = [ N2[1], N2[0], N2[3], N2[2], 'bold' ]


    let palette = {}

    let palette.normal = airline#themes#generate_color_map(N1, N2, N3)
    let palette.normal.airline_error   = ER
    let palette.normal.airline_warning = WI
    let palette.normal.airline_term    = TE

    let palette.insert   = palette.normal
    let palette.replace  = palette.normal
    let palette.visual   = palette.normal
    let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)

    if s:want_showmod
        let palette.normal_modified = { 'airline_a': NR, 'airline_z': NR }
    endif

    " Accents
    let palette.accents = {
                \ 'red': [ ER[1], '', ER[3], '' ]
                \ }

    " CtrlP
    if get(g:, 'loaded_ctrlp', 0)
        let palette.ctrlp = airline#extensions#ctrlp#generate_color_map(N3, N2, NR)
    endif

    let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
