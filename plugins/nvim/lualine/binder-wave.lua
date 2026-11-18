-- binder-wave.lua — lualine theme built from the binder-wave palette.
--
-- Usage: require('lualine').setup({ options = { theme = require('binder-wave-lualine') } })
-- (point your plugin manager at this file under whatever name you load it as).

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

-- Same light-dark() split as palette.css and colors/binder-wave.lua: dark
-- scheme reads the bright half of each accent, light reads the faded half.
local dark = vim.o.background ~= 'light'
local dim = dark and bright or faded

local p = dark and {
	bg = base.base03,
	bg1 = base.base02,
	fg = base.base2,
	fg3 = base.base0,
} or {
	bg = base.base3,
	bg1 = base.base2,
	fg = base.base02,
	fg3 = base.base00,
}

local function mode(accent)
	return {
		a = { bg = accent, fg = p.bg, gui = 'bold' },
		b = { bg = p.bg1, fg = p.fg },
		c = { bg = p.bg1, fg = p.fg3 },
	}
end

return {
	normal = mode(dim.blue),
	insert = mode(dim.green),
	visual = mode(dim.magenta),
	replace = mode(dim.red),
	command = mode(dim.yellow),
	inactive = {
		a = { bg = p.bg1, fg = p.fg3 },
		b = { bg = p.bg1, fg = p.fg3 },
		c = { bg = p.bg1, fg = p.fg3 },
	},
}
