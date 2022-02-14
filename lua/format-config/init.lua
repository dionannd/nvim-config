require'format'.setup {
  html = {{cmd = {"prettier -w"}}},
  css = {{cmd = {"prettier -w"}}},
  json = {{cmd = {"prettier -w"}}},
  yaml = {{cmd = {"prettier -w"}}},
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  lua = {
    {
      cmd = {
        function(file)
          return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
        end
      }
    }
  },
  python = {
  {
      cmd = {
        function(file)
          return string.format('black --quiet %s', file)
        end
      }
    }
  }
}

vim.cmd('autocmd BufWritePost * FormatWrite')
