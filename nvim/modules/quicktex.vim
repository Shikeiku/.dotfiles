" inoremap <space><space> <ESC>:call search('<+.*+>')<CR>"_c/+>/e<CR> 
"

let g:quicktex_python = {
    \}
 
    " \' '      : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
let g:quicktex_markdown = {
    \'dm'   : "\\[\<CR><+++>\<CR>.\\]\<CR><++>",
    \'mk'   : "\\( <+++>\\) <++>",
    \}

    " \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
let g:quicktex_tex = {
    \'dm'   : "\\[\<CR><+++>\<CR>.\\]\<CR><++>",
    \'mk'   : "\\( <+++>\\) <++>",
    \'prf' : "\\begin{proof}\<CR><+++>\<CR>\\end{proof}",
\'Section: Environments' : 'COMMENT',
    \'env' : "\<ESC>Bvedi\\begin{\<ESC>pa}{<+++>}\<CR><++>\<CR>\\end{\<ESC>pa}\<CR><++>",
    \'exe' : "\\begin{exercise}{<+++>}\<CR><++>\<CR>\\end{exercise}",
    \'thm' : "\\begin{theorem}\<CR><+++>\<CR>\\end{theorem}",
    \'lst' : "\\begin{enumerate}[a)]\<CR>\\item <+++>\<CR>\\end{enumerate}",
    \'eq'  : "\\begin{displaymath}\<CR><+++>\<CR>\\end{displaymath}",
    \'eqn' : "\\begin{equation}\\label{<+++>}\<CR><++>\<CR>\\end{equation}",
    \
\'Section: Other Commands' : 'COMMENT',
    \'itm'  : '\item ',
    \'sect' : "\\section*{<+++>}\<CR><++>",
    \'para' : '(<+++>) <++>',
    \'qt'   : "``<+++>'' <++>",
    \'cloze'   :  "\<ESC>gvdi{{c<+++>::\<ESC>gpi}}\<CR><++>",
    \
\'Section: Common Sets' : 'COMMENT',
    \'bn' : '\(\mathbb{N}\) ',
    \'bz' : '\(\mathbb{Z}\) ',
    \'bq' : '\(\mathbb{Q}\) ',
    \'br' : '\(\mathbb{R}\) ',
    \'bc' : '\(\mathbb{C}\) ',
    \'ba' : '\(\mathbb{A}\) ',
    \'bf' : '\(\mathbb{F}\) ',
\'Section: Fancy Variables' : 'COMMENT',
    \'fA' : '\(\mathcal{A}\) ',
    \'fo' : '\(\mathcal{O}\) ',
    \'fn' : '\(\mathcal{N}\) ',
    \'fp' : '\(\mathcal{P}\) ',
    \'ft' : '\(\mathcal{T}\) ',
    \'fc' : '\(\mathcal{C}\) ',
    \'fm' : '\(\mathcal{M}\) ',
    \'ff' : '\(\mathcal{F}\) ',
    \'fz' : '\(\mathcal{Z}\) ',
    \'fi' : '\(\mathcal{I}\) ',
    \'fb' : '\(\mathcal{B}\) ',
    \'fl' : '\(\mathcal{L}\) ',
    \'fv' : '\(\mathcal{V}\) ',
\'Section: Greek Letters' : 'COMMENT',
    \'alpha'   : '\(\alpha\) ',
    \'ga'      : '\(\alpha\) ',
    \'beta'    : '\(\beta\) ',
    \'gamma'   : '\(\gamma\) ',
    \'delta'   : '\(\delta\) ',
    \'epsilon' : '\(\varepsilon\) ',
    \'ge'      : '\(\varepsilon\) ',
    \'zeta'    : '\(\zeta\) ',
    \'eta'     : '\(\eta\) ',
    \'theta'   : '\(\theta\) ',
    \'iota'    : '\(\iota\) ',
    \'kappa'   : '\(\kappa\) ',
    \'lambda'  : '\(\lambda\) ',
    \'gl'      : '\(\lambda\) ',
    \'mu'      : '\(\mu\) ',
    \'nu'      : '\(\nu\) ',
    \'xi'      : '\(\xi\) ',
    \'omega'   : '\(\omega\) ',
    \'pi'      : '\(\pi\) ',
    \'rho'     : '\(\rho\) ',
    \'sigma'   : '\(\sigma\) ',
    \'tau'     : '\(\tau\) ',
    \'upsilon' : '\(\upsilon\) ',
    \'gu'      : '\(\upsilon\) ',
    \'phi'     : '\(\varphi\) ',
    \'chi'     : '\(\chi\) ',
    \'psi'     : '\(\psi\) ',
    \
\}

    " \' '    : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
let g:quicktex_math = {
\'Section: Greek Letters' : 'COMMENT',
    \';a'   : "\\alpha ",
    \';b'    : "\\beta ",
    \';g'   : "\\gamma ",
    \';d'   : "\\delta ",
    \';e' : "\\varepsilon ",
    \';z'    : "\\zeta ",
    \';h'     : "\\eta ",
    \';q'   : "\\theta ",
    \';o'    : "\\iota ",
    \';k'   : "\\kappa ",
    \';l'      : "\\lambda ",
    \';m'      : "\\mu ",
    \';n'      : "\\nu ",
    \';x'      : "\\xi ",
    \';w'   : "\\omega ",
    \';p'      : "\\pi ",
    \';r'     : "\\rho ",
    \';s'   : "\\sigma ",
    \';t'     : "\\tau ",
    \';y' : "\\upsilon ",
    \';f'     : "\\varphi ",
    \';c'     : "\\chi ",
    \';v'     : "\\psi ",
    \
\'Section: algebra' : 'COMMENT',
  \
  \'Section: fractions for textobjects' : 'COMMENT',
    \'//'  : '\frac{<+++>}{<++>} <++>',
    \"b/"   :  "\<ESC>BdiWi\\frac{\<C-R>\"}{<+++>} <++>",
    \"f/"   :  "\<ESC>b%Bd%a\\frac{\<ESC>pa}{<+++>} <++>",
  \
  \'Section: LaTeX' : 'COMMENT',
    \'sub'    : "\<BS>_{<+++>} <++>",
    \'sone'   : "\<BS>_1 ",
    \'stwo'   : "\<BS>_2 ",
    \'sthree' : "\<BS>_3 ",
    \'sfour'  : "\<BS>_4 ",
    \'tt'   : '\;\text{<+++>}\; <++>',
    \'space'   : '\;\;\; ',
    \'ssp'   : '\; ',
    \',,'   : "\<BS>,\\;\\;\\; ",
    \'align'   : "\\begin\{align\}\<CR><+++>\& <++>\\\\<++>\<CR>\\end\{align\}<++>",
    \'lign'   : "<+++>\& <++>\\\\<++>",
    \'bb'   : "\<ESC>Bi\\boldsymbol{\<ESC>Els} ",
    \
  \
  \'Section: Functions' : 'COMMENT',
    \'to'     : '\to ',
    \'mapsto' : '\mapsto ',
    \'comp'   : '\circ ',
    \'of'     : "\<BS>(<+++>) <++>",
    \'sin'    : '\sin{<+++>} <++>',
    \'cos'    : '\cos{<+++>} <++>',
    \'tan'    : '\tan{<+++>} <++>',
    \'gcd'    : '\gcd(<+++> ,<++>) <++>',
    \'ln'     : '\ln{<+++>} <++>',
    \'log'    : '\log{<+++>} <++>',
    \'df'     : '<+++> : <++> \to <++>',
    \'sqr'   : '\sqrt{<+++>} <++>',
    \'case'   : '\begin{cases} <+++> \end{cases} <++>',
  \
\'Section: Set Theory' : 'COMMENT',
    \'bn'    : '\mathbb{N} ',
    \'bz'    : '\mathbb{Z} ',
    \'bq'    : '\mathbb{Q} ',
    \'br'    : '\mathbb{R} ',
    \'bc'    : '\mathbb{C} ',
    \'ba'    : '\mathbb{A} ',
    \'bf'    : '\mathbb{F} ',
    \'mcp'   : '\mathcal{P} ',
    \'mcu'   : '\mathcal{U} ',
    \'mcf'   : '\mathcal{F} ',
    \'subs'  : '\subseteq ',
    \'in'    : '\in ',
    \'nin'   : '\not\in ',
    \'cup'   : '\cup ',
    \'cap'   : '\cap ',
    \'union' : '\bigcup ',
    \'sect'  : '\bigcap ',
    \'smin'  : '\setminus ',
    \'set'   : '\{<+++>\} <++>',
    \'empty' : '\varnothing ',
    \'pair'  : '(<+++>, <++>) <++>',
    \'ldots'  : '\ldots ',
    \'cdots'  : '\cdots ',
    \
\'Section: Logic' : 'COMMENT',
    \'exists'  : '\exists ',
    \'nexists' : '\nexists ',
    \'forall'  : '\forall ',
    \'implies' : '\implies ',
    \'iff'     : '\iff ',
    \'not'     : '\lnot ',
    \'and'     : '\land ',
    \'or'     : '\lor ',
    \
\'Section: Relations' : 'COMMENT',
    \'lt'      : '< ',
    \'gt'      : '> ',
    \'leq'     : '\leq ',
    \'geq'     : '\geq ',
    \'eq'      : '= ',
    \'nl'      : '\nless ',
    \'ng'      : '\ngtr ',
    \'nleq'    : '\nleq ',
    \'ngeq'    : '\ngeq ',
    \'neq'     : '\neq ',
    \'neg'     : '\neg ',
    \
\'Section: Operations' : 'COMMENT',
    \'add'   : '+ ',
    \'min'   : '- ',
    \'recip' : '\frac{1}{<+++>} <++>',
    \'dot'   : '\cdot ',
    \'mult'  : '* ',
    \'td'   : "\<BS>^{<+++>} <++>",
    \'sr'    : "\<BS>^2 ",
    \'inv'   : "\<BS>^{-1} ",
    \'xx' : '\times ',
    \'partial'   :  '\frac{\partial <+++>}{\partial <++>} <++>',
    \
\'Section: Delimiters' : 'COMMENT',
    \'bpara' : '\left( <+++> \right) <++>',
    \'para'  : '(<+++>) <++>',
    \'bsb'   : '\left[ <+++> \right] <++>',
    \'sb'    : '[<+++>] <++>',
    \'bbra'  : '\left\{ <+++> \right\} <++>',
    \'bra'   : '\{<+++>\} <++>',
    \
  \'Section: surroundings' : 'COMMENT',
    \'ys' : "\\left( <+++>\\right) <++>",
    \'ysb' : "\\left( <+++>\\right) <++>",
    \'ysB' : "\\left\\{ <+++>\\right\\} <++>",
    \"ysq"   :    "\\left[ <+++>\\right] <++>",
    \'ys|'   :  "\\left\| <+++> \\right\| <++>",
\'Section: Group Theory' : 'COMMENT',
    \'sdp'   : '\rtimes ',
    \'niso'  : '\niso ',
    \'subg'  : '\leq ',
    \'nsubg' : '\trianglelefteq ',
    \
\'Section: Encapsulating keywords' : 'COMMENT',
    \'hat'  : "\<ESC>Bi\\hat{\<ESC>Els} ",
    \'bar'  : "\<ESC>Bi\\overline{\<ESC>Els} ",
    \'tild'  : "\<ESC>Bi\\tild{\<ESC>Els} ",
    \'vec'  : "\<ESC>Bi\\vec{\<ESC>Els} ",
    \'star'  : "\<BS>^* ",
    \
\'Section: Linear Algebra' : 'COMMENT',
    \'GL'     : '\text{GL} ',
    \'SL'     : '\text{SL} ',
    \'com'    : "\<BS>^c ",
    \'matrix' : "\\begin{bmatrix}\<CR><+++>\<CR>\\end{bmatrix}<++>",
    \'vdots'  : '\vdots & ',
    \'ddots'  : '\ddots & ',
    \
\'Section: Constants' : 'COMMENT',
    \'aleph' : '\aleph ',
    \'ooo'   : '\infty ',
    \'one'   : '1 ',
    \'zero'  : '0 ',
    \'two'   : '2 ',
    \'three' : '3 ',
    \'four'  : '4 ',
    \
\'Section: Operators' : 'COMMENT',
    \'int'    : '\int <+++> \mathop{d <++>} <++>',
    \'dint'    : '\int_{<+++>}^{<++>} <++> \mathop{d <++>} <++>',
    \'dev'    : '\frac{d}{d <+++>} <++>',
    \'lim'    : '\lim_{<+++>} <++>',
    \'sum'    : '\sum_{<+++>}^{<++>} <++>',
    \'prod'   : '\prod ',
    \'limsup' : '\limsup ',
    \'liminf' : '\liminf ',
    \'sup'    : '\sup ',
    \'sinf'   : '\inf ',
    \'hamil'   : '\mathcal{H} ',
\}


