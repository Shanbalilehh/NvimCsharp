-- lua/plugins/neotree.lua
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Requires a Nerd Font in your terminal
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        -- 1. Behavior
        close_if_last_window = true, -- Close Neovim if only the tree is left
        
        -- 2. Appearance
        window = {
          width = 30, -- Width of the sidebar
        },
        
        -- 3. Filesystem settings
        filesystem = {
          filtered_items = {
            visible = true, -- Show hidden files?
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              ".git",
              -- Clean up the view for C# devs:
              "bin",
              "obj",
            },
          },
          -- "Follow" the file you are editing
          follow_current_file = { enabled = true },
        },
      })

      -- Keymap to toggle the tree
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true })
    end,
  }
}
