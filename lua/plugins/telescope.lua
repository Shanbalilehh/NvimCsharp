-- lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      
      -- VS Code-like navigation keys
      vim.keymap.set("n", "<C-p>", builtin.find_files, {}) -- Ctrl+P to find files
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- Space+fg to search text inside files
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {}) -- Space+fb to find open buffers
      
      -- Minimal configuration
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { 
            "node_modules", 
            ".git", 
            "bin", -- Ignore C# build artifacts
            "obj" 
          } 
        }
      })
    end,
  }
}
