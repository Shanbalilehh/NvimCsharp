-- lua/plugins/lualine.lua
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_x = {
            {
              function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                -- FIX: Use vim.lsp.get_clients() instead of get_active_clients()
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then return msg end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return "LSP: " .. client.name
                  end
                end
                return msg
              end,
              icon = " ",
              color = { fg = "#ffffff", gui = "bold" },
            },
            "encoding",
            "fileformat",
            "filetype",
          },
        },
      })
    end,
  }
}
