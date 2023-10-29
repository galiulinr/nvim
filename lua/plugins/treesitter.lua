require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "c", "go", "rust", "python" },

  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}
