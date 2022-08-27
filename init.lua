require('dion.base')
require('dion.highlights')
require('dion.maps')
require('dion.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has 'macunix'
local is_win = has 'win32'

if is_mac then
  require('dion.macos')
end
if is_win then
  require('dion.windows')
end
