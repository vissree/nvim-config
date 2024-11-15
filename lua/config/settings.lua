vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
local options = {
  backup = false,                          -- creates a backup file
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  cursorline = true,                       -- highlight the current line
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = false,                        -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  incsearch = true,
  mouse = "",                              -- do not allow the mouse to be used in neovim ["a", "n", "v", "i" "c"]

  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  relativenumber = true,                   -- set relative line numbers

  wrap = true,
  pumheight = 10,   -- pop up menu height
  scrolloff = 8,
  shiftwidth = 2,   -- the number of spaces inserted for each indentation
  tabstop = 2,      -- insert 2 spaces for a tab
  softtabstop = 2,
  showtabline = 2,  -- always show tabs
  expandtab = true, -- convert tabs to spaces

  sidescrolloff = 8,
  showmode = false,     -- we don't need to see things like -- INSERT -- anymore
  signcolumn = "yes",   -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,     -- smart case
  smartindent = true,   -- make indenting smarter again
  splitbelow = true,    -- force all horizontal splits to go below current window
  splitright = true,    -- force all vertical splits to go to the right of current window

  swapfile = false,     -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000,    -- time to wait for a mapped sequence to complete (in milliseconds)

  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,     -- enable persistent undo
  updatetime = 300,    -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.isfname:append("@-@")
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
