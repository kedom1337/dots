local o = vim.opt

vim.g.mapleader = " "

vim.g.skip_ts_context_commentstring_module = true

o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true

o.laststatus = 3
o.showmode = false

o.number = true
o.numberwidth = 2

o.splitbelow = true
o.splitright = true

o.spelllang = "en,de"

o.mouse = "a"
o.cursorline = true
o.wrap = false
o.colorcolumn = "85"
o.signcolumn = "yes"
o.termguicolors = true
o.undofile = true
o.scrolloff = 8
o.pumheight = 10
o.shortmess:append "sI"
o.clipboard = "unnamedplus"

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
