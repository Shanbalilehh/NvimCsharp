-- lua/plugins/theme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load immediately (don't lazy load the theme)
    priority = 1000, -- Load before everything else
    config = function()
      -- actually load the theme
      vim.cmd([[colorscheme tokyonight]])
    end,
  }
}
