let s:theme = 'superdark'

let s:want_showmod = get(g:, 'airline_superdark_showmod', 0)

function! airline#themes#{s:theme}#refresh()
    " Normal
    let N1 = [ '#e8e8e8', '#40423C', 254, 237 ]
    let N2 = [ '#e8e8e8', '#373832', 254, 237 ]
    let N3 = [ '#75715f', '#2D2E27', 255, 235 ]

    " Inactive
    let IA = [ '#75715f', N3[1], 242, N3[3] ]

    " Error
    let ER = N3

    " Warning
    let WI = N3

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
    " let palette.inactive = airline#themes#generate_color_map(IA, IA, IA)
    let palette.inactive = palette.normal

    if s:want_showmod
        let palette.normal_modified = { 'airline_a': NR, 'airline_z': NR }
    endif

    " Accents
    let palette.accents = {
                \ 'red': [ ER[1], '', ER[3], '' ]
                \ }

    let g:airline#themes#{s:theme}#palette = palette
endfunction

call airline#themes#{s:theme}#refresh()
