vim.opt.display = 'lastline'  -- Avoid neovim/neovim#11362
vim.opt.directory = ''

local __file__ = debug.getinfo(1).source:match("@(.*)$")
local lean_nvim_dir = vim.fn.fnamemodify(__file__, ':p:h:h')
local packpath = lean_nvim_dir .. '/packpath/*'
vim.opt.runtimepath:append(packpath)
vim.opt.runtimepath:append(lean_nvim_dir)

vim.cmd[[
  runtime! plugin/lspconfig.vim
  runtime! plugin/plenary.vim
]]

-- plenary forks subprocesses, so enable coverage here when appropriate
if vim.env.LEAN_NVIM_COVERAGE then
  local luapath = lean_nvim_dir .. '/luapath'
  package.path = package.path .. ';' .. luapath .. '/share/lua/5.1/?.lua;'
                                     .. luapath .. '/share/lua/5.1/?/init.lua;;'
  package.cpath = package.cpath .. ';' .. luapath .. '/lib/lua/5.1/?.so;'
  require('luacov')
end
