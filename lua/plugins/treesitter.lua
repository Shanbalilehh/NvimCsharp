-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- specific to this plugin, verify that we want the latest commit of the branch
    branch = "master",
    build = ":TSUpdate", -- Auto-update parsers when the plugin updates
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        -- 1. Explicitly list the parsers we want
        -- "c_sharp" is the internal name for C#
        ensure_installed = { 
            "c_sharp", 
            "lua", 
            "vim", 
            "vimdoc", 
            "query", 
            "json",
            "markdown" 
        },

        -- 2. Install synchronously so we see errors immediately if they happen
        sync_install = false,

        -- 3. Enable core modules
        highlight = { enable = true }, -- The main feature
        indent = { enable = true },    -- Better indentation than default
      })
    end,
  }
}
