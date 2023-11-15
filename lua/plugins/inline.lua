--Telescope fzf plugin
require("telescope").load_extension('fzf')

--Autosave plugin
require("auto-save").setup({})

require('bufdel').setup {
  next = 'tabs',
  quit = true,  -- quit Neovim when last buffer is closed
}

require('toggleterm').setup({
  open_mapping = '<leader>tt',
  direction = 'horizontal',
  shade_terminals = true
})
