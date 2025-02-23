local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	--AI
'github/copilot.vim',
    -- LSP
    'neovim/nvim-lspconfig', -- LSP
    'hrsh7th/nvim-cmp', -- Autocomplete
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip', -- Сниппеты
    'nvim-treesitter/nvim-treesitter', -- Подсветка синтаксиса
    -- Telescope
    'nvim-lua/plenary.nvim', -- For Telescope plugin
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    -- {
    -- "nvim-telescope/telescope-file-browser.nvim",
    -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    -- },
    -- Themes
    'ayu-theme/ayu-vim',
    'rebelot/kanagawa.nvim',
    'catppuccin/nvim',
    'Mofiqul/dracula.nvim',
    -- Lazy
    {
     "vague2k/vague.nvim",
        config = function()
        -- NOTE: you do not need to call setup if you don't want to.
        require("vague").setup({
        -- optional configuration here
          transparent = false, -- don't set background
          style = {
              -- "none" is the same thing as default. But "italic" and "bold" are also valid options
              boolean = "bold",
              number = "none",
              float = "none",
              error = "bold",
              comments = "italic",
              conditionals = "none",
              functions = "none",
              headings = "bold",
              operators = "none",
              strings = "italic",
              variables = "none",

              -- keywords
              keywords = "none",
              keyword_return = "italic",
              keywords_loop = "none",
              keywords_label = "none",
              keywords_exception = "none",

              -- builtin
              builtin_constants = "bold",
              builtin_functions = "none",
              builtin_types = "bold",
              builtin_variables = "none",
          },
          -- plugin styles where applicable
          -- -- make an issue/pr if you'd like to see more styling options!
          plugins = {
              cmp = {
                  match = "bold",
                  match_fuzzy = "bold",
              },
              dashboard = {
                  footer = "italic",
              },
              lsp = {
                  diagnostic_error = "bold",
                  diagnostic_hint = "none",
                  diagnostic_info = "italic",
                  diagnostic_warn = "bold",
              },
              neotest = {
                  focused = "bold",
                  adapter_name = "bold",
              },
              telescope = {
                  match = "bold",
              },
          },
          -- Override colors
          colors = {
              bg = "#1e1e2e",
              fg = "#cdcdcd",
              floatBorder = "#878787",
              line = "#252530",
              comment = "#606079",
              builtin = "#b4d4cf",
              func = "#c48282",
              string = "#e8b589",
              number = "#e0a363",
              property = "#c3c3d5",
              constant = "#aeaed1",
              parameter = "#bb9dbd",
              visual = "#333738",
              error = "#df6882",
              warning = "#f3be7c",
              hint = "#7e98e8",
              operator = "#90a0b5",
              keyword = "#6e94b2",
              type = "#9bb4bc",
              search = "#405065",
              plus = "#8cb66d",
              delta = "#f3be7c",
          },
      })
  end
  },
  {
    'folke/zen-mode.nvim',
    opts = {
        window = {
            width = 90,
        },
    }
  },
})
