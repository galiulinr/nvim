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
  
    --LSP and autocomplete
    --
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    --

    --Colorschemes
    --"rmehri01/onenord.nvim",
    "jacoborus/tender.vim",
    "rebelot/kanagawa.nvim",
    --"catppuccin/nvim",
    "Mofiqul/vscode.nvim",
    --"projekt0n/github-nvim-theme",
    "dracula/vim",
    --

    "Pocco81/auto-save.nvim",
    "justinmk/vim-sneak",

    -- JS/JSX/TS
    --"pangloss/vim-javascript",
    --"leafgarland/typescript-vim",
    --"peitalin/vim-jsx-typescript",
    --"maxmellon/vim-jsx-pretty",
    --TS from here https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
    "jose-elias-alvarez/null-ls.nvim",
    --"jose-elias-alvarez/nvim-lsp-ts-utils",

    "nvim-lua/plenary.nvim",
    
    --'prettier/vim-prettier', {
    --    \ 'do': 'npm install --frozen-lockfile --production',
    --  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact',
    --  \ 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte',
    --  \ 'yaml', 'html'] }

    "bmatcuk/stylelint-lsp",
    
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    -- Convenient floating terminal window
    --"Plug 'voldikss/vim-floaterm'

    'ray-x/lsp_signature.nvim',
    --{ "folke/neoconf.nvim", cmd = "Neoconf" },
    --"folke/neodev.nvim",
    --
    "nvim-lualine/lualine.nvim",
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }},
    {
        's1n7ax/nvim-window-picker',
        version = '2.*',
    },
    "ojroques/nvim-bufdel",
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "akinsho/toggleterm.nvim",
})
