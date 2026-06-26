-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Windows clipboard from WSL
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },

    paste = {
      ["+"] = [[powershell.exe -NoLogo -NoProfile -Command "Get-Clipboard -Raw | ForEach-Object { $_ -replace \"`r\", \"\" }"]],
      ["*"] = [[powershell.exe -NoLogo -NoProfile -Command "Get-Clipboard -Raw | ForEach-Object { $_ -replace \"`r\", \"\" }"]],
    },
    cache_enabled = 0,
  }
end

vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = false

-- español e inglés por defecto para archivos md, text y tex
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "es,en"
  end,
})
