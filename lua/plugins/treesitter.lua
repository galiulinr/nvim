require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'cpp',
    'python',
    'rust',
    'go',
    'json',
    'lua',
    'markdown',
    'markdown_inline'
  },
})
