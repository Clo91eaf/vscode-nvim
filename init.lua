local vscode = require("vscode")

require("keymaps")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.ignorecase = true
vim.o.smartcase = true

if vim.g.vscode then
  vim.notify = vscode.notify
end

-- yank highlight
vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "highlight_yank",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- NOTE: only works in local vscode neovim
-- vim.g.clipboard = vim.g.vscode_clipboard
vim.o.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = function() return vim.split(vim.fn.getreg('"'), '\n') end,
    ["*"] = function() return vim.split(vim.fn.getreg('"'), '\n') end,
  },
}
