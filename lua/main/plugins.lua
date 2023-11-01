--Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

--Plugin List
require("lazy").setup({

    --Colorscheme-- 
    
    --{'cooperuser/glowbeam.nvim'}, 
    --{'joshdick/onedark.vim'},
    --{'projekt0n/github-nvim-theme'},
    --{'rebelot/kanagawa.nvim'},
    {'shaunsingh/nord.nvim'},

    --GUI--
    
    --Dashboard
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },
    --Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },
    --Files browser
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    },
    --Tabs
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
    --Terminal
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    --Fonts
    {'nvim-tree/nvim-web-devicons'},
    --Buffer management
    {'Djancyp/outline'}, {'terrortylor/nvim-comment'},
    --Hotkey List
    {"folke/which-key.nvim"},


    --Portable package manager--
        
    {"williamboman/mason.nvim"},    
        

    --Search--
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {'nvim-lua/plenary.nvim'}
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
    },


    --Editor--

    {'nvim-treesitter/nvim-treesitter'}, -- highlighting
    {'windwp/nvim-autopairs'},
    {'windwp/nvim-ts-autotag'},

    --GIT--
        
    {'lewis6991/gitsigns.nvim'},
    {'tpope/vim-fugitive'},
        
    --LSP--
    
    --Lsp server configs
    {'neovim/nvim-lspconfig'},

    --CMP - autocompletion plugin
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},

    --Snippet
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/vim-vsnip'},
    {'rafamadriz/friendly-snippets'},
    {'hrsh7th/vim-vsnip-integ'},

    --{'jose-elias-alvarez/null-ls.nvim'}, -- LSP diagnostics    
    --{'hrsh7th/cmp-nvim-lsp-signature-help'}, {
    --    'linrongbin16/lsp-progress.nvim',
    --    event = {'VimEnter'},
    --    dependencies = {'nvim-tree/nvim-web-devicons'},
    --    config = function() require('lsp-progress').setup() end
    --},
    --
    --{
    --  "folke/flash.nvim",
    --  event = "VeryLazy",
    --  ---@type Flash.Config
    --  opts = {},
    --  keys = {
    --   {
    --      "s",
    --     mode = { "n", "x", "o" },
    --      function()
    -- require("flash").jump({
    --  search = {
    --   mode = function(str)
    --      return "\\<" .. str
    --    end,
    --  },
    -- })
    --      end,
    --     desc = "Flash",
    --    },
    --    {
    --      "S",
    --      mode = { "n", "o", "x" },
    --      function()
    --        require("flash").treesitter()
    --     end,
    --      desc = "Flash Treesitter",
    --    },
    --    {
    --      "r",
    --      mode = "o",
    --      function()
    --        require("flash").remote()
    --      end,
    --      desc = "Remote Flash",
    --    },
    --    {
    --      "R",
    --     mode = { "o", "x" },
    --      function()
    --        require("flash").treesitter_search()
    --      end,
    --      desc = "Flash Treesitter Search",
    --    },
    --    {
    --      "<c-s>",
    --      mode = { "c" },
    --      function()
    --        require("flash").toggle()
    --      end,
    --      desc = "Toggle Flash Search",
    --    },
    -- },
    --}
    });
