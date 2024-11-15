return {
  { "tpope/vim-fugitive", lazy = true },
  {
    "tpope/vim-commentary",
    lazy = true,
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    end
  },
}
