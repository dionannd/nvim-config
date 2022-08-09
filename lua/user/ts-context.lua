local status_ok, context = pcall(require, "treesitter-context")
if not status_ok then
	return
end

context.setup{
  enable = true,
  throttle = true,
  max_lines = vim.o.scrolloff - 1,
  patterns = {},
}

