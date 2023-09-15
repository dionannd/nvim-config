require('dion.base')
require('dion.highlights')
require('dion.maps')
require('dion.plugins')

local has = vim.fn.has
local is_mac = has 'macunix'
local is_linux = has "unix"
local is_win = has 'win32'
local is_wsl = has 'wsl'

if is_mac then
  require('dion.macos')
end
if is_win then
  require('dion.windows')
end
