return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = {
    -- adds fun icons next to files;
    -- requires devicons to be installed on the system
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("oil").setup()

    vim.keymap.set("n", "<leader>0", "<CMD>Oil<CR>")
  end
}
