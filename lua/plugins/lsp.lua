-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- 1. Setup Mason (The installer)
      require("mason").setup()
      
      -- 2. Define the servers we want
      local servers = { "omnisharp" }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
      })

      -- 3. Define the common on_attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        -- Navigation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- Actions
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      -- 4. Native Setup (No lspconfig dependency for setup)
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Explicitly configure OmniSharp
      vim.lsp.config["omnisharp"] = {
        cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
        root_markers = { ".sln", ".csproj" }, -- Native root detection
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
          },
        },
      }

      -- 5. Enable the server
      vim.lsp.enable("omnisharp")
    end,
  }
}
