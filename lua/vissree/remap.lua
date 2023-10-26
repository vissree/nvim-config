vim.g.python3_host_prog = os.getenv("HOME").."/.pyenv/versions/neovim-default/bin/python"
vim.g.mapleader = " "

-- Options
local options = {
	backup = false,                         -- creates a backup file
	cmdheight = 2,                          -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" },-- mostly just for cmp
	conceallevel = 0,                       -- so that `` is visible in markdown files
	cursorline = true,                      -- highlight the current line
	expandtab = true,                       -- convert tabs to spaces
	fileencoding = "utf-8",                 -- the encoding written to a file
  guicursor = "",                         -- thick cursor
	guifont = "monospace:h17",              -- the font used in graphical neovim applications
	hlsearch = true,                        -- highlight all matches on previous search pattern
	ignorecase = true,                      -- ignore case in search patterns
  incsearch = true,
	mouse = "",                             -- do not allow the mouse to be used in neovim ["a", "n", "v", "i" "c"]
	number = true,                          -- set numbered lines
	numberwidth = 4,                        -- set number column width to 2 {default 4}
	pumheight = 10,                         -- pop up menu height
  relativenumber = true,                  -- set relative line numbers
	scrolloff = 8,                          -- is one of my fav
	shiftwidth = 2,                         -- the number of spaces inserted for each indentation
	showmode = false,                       -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2,                        -- always show tabs
	sidescrolloff = 8,
	signcolumn = "yes",                     -- always show the sign column, otherwise it would shift the text each time
	smartcase = true,                       -- smart case
	smartindent = true,                     -- make indenting smarter again
	splitbelow = true,                      -- force all horizontal splits to go below current window
	splitright = true,                      -- force all vertical splits to go to the right of current window
	swapfile = false,                       -- creates a swapfile
	tabstop = 2,                            -- insert 2 spaces for a tab
	termguicolors = true,                   -- set term gui colors (most terminals support this)
	timeoutlen = 1000,                      -- time to wait for a mapped sequence to complete (in milliseconds)
  undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,                        -- enable persistent undo
	updatetime = 300,                       -- faster completion (4000ms default)
	writebackup = false,                    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

-- Remaps
--
-- netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks of text together
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place after
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keep clipboard after paste over
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Use system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- set execute bit on current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Renameall refs
vim.cmd([[ command! RenameAllRef execute 'lua vim.lsp.buf.rename()' ]])
