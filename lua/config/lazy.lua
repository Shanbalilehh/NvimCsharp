-- lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 1. Bootstrap: If not found, clone it from GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- 2. Add lazy to the runtime path so Neovim can find it
vim.opt.rtp:prepend(lazypath)

-- 3. Configure lazy and tell it where to find plugin specs
require("lazy").setup({
  spec = {
    -- Import any file in lua/plugins/*.lua
    { import = "plugins" },
  },
  -- Automatically check for plugin updates
  checker = { enabled = true },
})
