-- lua/config/options.lua

-- 1. Space Leader
-- Must be set before any plugins are loaded
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. UI Basics
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Relative line numbers (good for jumping)
vim.opt.signcolumn = "yes"        -- Keep space for LSP icons (prevents shifting)

-- 3. Indentation (Standard C# is 4 spaces)
vim.opt.tabstop = 4               -- Number of spaces that a <Tab> counts for
vim.opt.shiftwidth = 4            -- Size of an indent
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Insert indents automatically

-- 4. Search
vim.opt.ignorecase = true         -- Ignore case in search patterns
vim.opt.smartcase = true          -- ...unless the pattern contains upper case

-- 5. System Integration
vim.opt.clipboard = "unnamedplus" -- Sync with Windows clipboard (via WSL)
vim.opt.mouse = "a"               -- Enable mouse support in all modes

