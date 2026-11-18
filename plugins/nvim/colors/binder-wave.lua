-- binder-wave.lua — Neovim colorscheme built from the binder-wave palette
-- (see ../../../palette.css for the canonical 16 hex values).
--
-- CSS has light-dark() to resolve the faded/bright accent pair per scheme;
-- Neovim doesn't, so this picks the right half by hand based on
-- vim.o.background, same split the CSS makes.

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') == 1 then
	vim.cmd('syntax reset')
end
vim.o.termguicolors = true
vim.g.colors_name = 'binder-wave'

local base = {
	base03 = '#252525',
	base02 = '#303030',
	base01 = '#6a6a6a',
	base00 = '#777777',
	base0 = '#909090',
	base1 = '#9e9e9e',
	base2 = '#e8e8e8',
	base3 = '#f7f7f7',
}

local accents = {
	yellow = '#a4910f',
	orange = '#c05922',
	red = '#dc316a',
	magenta = '#c046a7',
	violet = '#7a68ce',
	blue = '#288aca',
	cyan = '#27a09f',
	green = '#51a169',
}

local faded = {
	yellow = '#827200',
	orange = '#9b3b01',
	red = '#b3004e',
	magenta = '#9e2187',
	violet = '#594bad',
	blue = '#006ba2',
	cyan = '#007f7f',
	green = '#30814c',
}

local bright = {
	yellow = '#c7b137',
	orange = '#e5783f',
	red = '#ff5a88',
	magenta = '#e368c8',
	violet = '#9b86f0',
	blue = '#55aaec',
	cyan = '#51c1bf',
	green = '#71c288',
}

local dark = vim.o.background ~= 'light'
-- Same light-dark() split as palette.css: dark scheme reads the bright
-- half of each accent, light scheme reads the faded half.
local dim = dark and bright or faded

local p = dark and {
	bg = base.base03,
	bg1 = base.base02,
	bg2 = base.base01,
	bg3 = base.base00,
	fg = base.base2,
	fg2 = base.base1,
	fg3 = base.base0,
} or {
	bg = base.base3,
	bg1 = base.base2,
	bg2 = base.base1,
	bg3 = base.base0,
	fg = base.base02,
	fg2 = base.base01,
	fg3 = base.base00,
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

hi('Normal', { fg = p.fg, bg = p.bg })
hi('NormalFloat', { fg = p.fg, bg = p.bg1 })
hi('FloatBorder', { fg = p.bg2, bg = p.bg1 })
hi('Comment', { fg = p.fg3, italic = true })
hi('Constant', { fg = dim.cyan })
hi('String', { fg = dim.green })
hi('Character', { fg = dim.green })
hi('Number', { fg = dim.magenta })
hi('Boolean', { fg = dim.magenta })
hi('Identifier', { fg = dim.blue })
hi('Function', { fg = dim.blue, bold = true })
hi('Statement', { fg = dim.violet, bold = true })
hi('Conditional', { fg = dim.violet })
hi('Repeat', { fg = dim.violet })
hi('Keyword', { fg = dim.violet })
hi('Operator', { fg = p.fg2 })
hi('PreProc', { fg = dim.orange })
hi('Include', { fg = dim.orange })
hi('Type', { fg = dim.yellow })
hi('StorageClass', { fg = dim.yellow })
hi('Structure', { fg = dim.yellow })
hi('Special', { fg = dim.red })
hi('SpecialChar', { fg = dim.red })
hi('Underlined', { fg = dim.blue, underline = true })
hi('Error', { fg = base.base3, bg = dim.red, bold = true })
hi('Todo', { fg = dim.yellow, bg = p.bg1, bold = true })

hi('LineNr', { fg = p.fg3 })
hi('CursorLineNr', { fg = dim.yellow, bold = true })
hi('CursorLine', { bg = p.bg1 })
hi('Visual', { bg = p.bg2 })
hi('Search', { fg = p.bg, bg = dim.yellow })
hi('IncSearch', { fg = p.bg, bg = dim.orange })
hi('MatchParen', { bg = p.bg2, bold = true })

hi('Pmenu', { fg = p.fg, bg = p.bg1 })
hi('PmenuSel', { fg = p.bg, bg = dim.blue })
hi('PmenuSbar', { bg = p.bg1 })
hi('PmenuThumb', { bg = p.bg2 })

hi('StatusLine', { fg = p.fg, bg = p.bg1 })
hi('StatusLineNC', { fg = p.fg3, bg = p.bg1 })
hi('VertSplit', { fg = p.bg1, bg = p.bg })
hi('WinSeparator', { fg = p.bg1, bg = p.bg })
hi('TabLine', { fg = p.fg3, bg = p.bg1 })
hi('TabLineSel', { fg = p.fg, bg = p.bg2 })
hi('TabLineFill', { bg = p.bg1 })

hi('DiffAdd', { fg = dim.green, bg = p.bg1 })
hi('DiffChange', { fg = dim.yellow, bg = p.bg1 })
hi('DiffDelete', { fg = dim.red, bg = p.bg1 })
hi('DiffText', { fg = dim.blue, bg = p.bg1, bold = true })

hi('DiagnosticError', { fg = dim.red })
hi('DiagnosticWarn', { fg = dim.yellow })
hi('DiagnosticInfo', { fg = dim.blue })
hi('DiagnosticHint', { fg = dim.cyan })
hi('DiagnosticUnderlineError', { undercurl = true, sp = dim.red })
hi('DiagnosticUnderlineWarn', { undercurl = true, sp = dim.yellow })
hi('DiagnosticUnderlineInfo', { undercurl = true, sp = dim.blue })
hi('DiagnosticUnderlineHint', { undercurl = true, sp = dim.cyan })

-- vim-gitgutter
hi('GitGutterAdd', { fg = dim.green })
hi('GitGutterChange', { fg = dim.yellow })
hi('GitGutterDelete', { fg = dim.red })

-- vim-fugitive
hi('diffAdded', { fg = dim.green })
hi('diffRemoved', { fg = dim.red })
