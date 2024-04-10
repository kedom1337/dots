local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

g.skip_ts_context_commentstring_module = true

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  g["loaded_" .. provider .. "_provider"] = 0
end

o.number = true
o.numberwidth = 2

o.cursorline = true
o.colorcolumn = "85"
o.signcolumn = "yes"

o.laststatus = 3
o.showmode = false

o.wrap = false
o.scrolloff = 10
o.pumheight = 10

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

o.mouse = "a"
o.clipboard = "unnamedplus"
o.shortmess:append("sI")
o.timeoutlen = 300
o.inccommand = "split"

o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true

o.spelllang = "en,de"
o.swapfile = false
