vim.cmd.set("nu rnu shiftwidth=4 tabstop=4 softtabstop=4 smartindent autoindent splitright splitbelow")
vim.cmd.set("encoding=UTF-8 nobackup nowritebackup nocursorline splitright splitbelow ")
vim.cmd.set("foldmethod=indent foldlevel=99 foldenable")
vim.opt.ignorecase = true
vim.g.mapleader = " "

vim.cmd([[nnoremap <C-h> <C-w>h]])
vim.cmd([[nnoremap <C-j> <C-w>j]])
vim.cmd([[nnoremap <C-k> <C-w>k]])
vim.cmd([[nnoremap <C-l> <C-w>l]])
vim.cmd([[vnoremap <C-c> "+y]])
vim.cmd([[nnoremap <C-t> :Themery <CR>]])
vim.cmd([[nnoremap <C-e> :e <C-R>=expand('%:p:h')<CR><CR>]])
vim.cmd([[nnoremap <leader>nn :Neorg workspace<CR>]])
vim.cmd([[nnoremap <leader>ns :Neorg workspace test<CR>]])
vim.cmd([[nnoremap <leader>ni :Neorg index<CR>]])
vim.cmd([[nnoremap <esc> :noh <CR>]])

---------------------------------------------------------------------------
-- lazy.nvim
---------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = {
		import = "plugins",
  	},
  	checker = { enabled = true },
})


