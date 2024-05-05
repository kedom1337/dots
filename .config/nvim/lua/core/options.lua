local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

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
o.colorcolumn = "85,120"
o.signcolumn = "yes"

o.laststatus = 3
o.showmode = false

o.wrap = false
o.scrolloff = 10
o.pumheight = 10
o.smoothscroll = true

o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

o.mouse = "a"
o.clipboard = "unnamedplus"

o.shortmess:append("WcIs")
o.matchpairs:append("<:>")
o.splitkeep = "screen"
o.inccommand = "split"

o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.infercase = true

o.splitbelow = true
o.splitright = true

o.spelllang = "en,de"
o.swapfile = false
o.undofile = true
