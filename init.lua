local impatient_ok, impatient = pcall(require, 'impatient')
if impatient_ok then
  impatient.enable_profile()
end

for _, source in ipairs {
  'dion.base',
  'dion.highlights',
  'dion.maps',
  'dion.plugins',
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_write('Failed to load ' .. source .. '\n\n' .. fault )
  end
end

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
