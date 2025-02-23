require("plugins")
require("statusline")
require("keymaps")


vim.opt.mouse = "a" -- Enable mouse support
vim.opt.encoding = "utf-8"       -- Общая кодировка (необязательно, по умолчанию UTF-8)
vim.opt.fileencoding = "utf-8"  -- Кодировка файлов
vim.opt.number = true -- Show line numbers
vim.opt.cursorline = false -- Disable highlight current cursor's line
vim.opt.swapfile = false -- Disable .swp files :w
vim.opt.scrolloff = 7 -- Number of lines left visible above/below the cursor when scrolling
vim.opt.tabstop = 4 -- Spaces instead of one tab
vim.opt.softtabstop = 4 -- Spaces instead of one tab
vim.opt.shiftwidth = 4 -- Spaces for auto indent
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.autoindent = true -- Save indent on new line
vim.opt.fileformat = "unix"
vim.opt.smartindent = true
vim.opt.splitbelow = true -- horizontal split open below and right
vim.opt.splitright = true
--vim.opt.termguicolors = true -- 24-bit colors
vim.opt.colorcolumn = "80"

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 4
vim.g.netrw_browse_split =3
vim.api.nvim_set_keymap('n', '<leader>ed', ':Lexplore %:p:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ea', ':Lexplore<CR>', { noremap = true, silent = true })

vim.opt.guifont = "Jetbrains Mono"

-- Keymaps for programming languages
vim.api.nvim_create_autocmd('FileType', {

    pattern = 'python',
    callback = function()

        vim.opt.colorcolumn = '88'
        vim.keymap.set('n', '<C-h>', ':w<CR>:!python3.11 %<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!python3.11 %<CR>', { buffer = true, silent = true })
    end
})


vim.api.nvim_create_autocmd('FileType', {
    pattern = 'c',
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!gcc % -o out; ./out<CR>', { buffer = true, silent = true })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cpp',
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!g++ % -o out; ./out<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!g++ % -o out; ./out<CR>', { buffer = true, silent = true })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'sh', 'go'},
    callback = function()
        vim.keymap.set('n', '<C-h>', ':w<CR>:!%<CR>', { buffer = true, silent = true })
        vim.keymap.set('i', '<C-h>', '<Esc>:w<CR>:!%<CR>', { buffer = true, silent = true })
    end
})



-- Color scheme
vim.cmd([[colorscheme vague]]) -- kanagawa-wave, kanagawa-dragon, kanagawa-lotus

-- LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
-- Быстрые команды для LSP
local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n','gD',vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } 
    end, opts)
end

-- Настройка LSP для Python (Pyright)
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
})
-- Настройка LSP для C++ (clangd)
lspconfig.clangd.setup({
  cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose'},
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    fallbackFlags = { '-std=c++23' },
  },
})

-- local lspconfig = require('lspconfig')
-- lspconfig.ccls.setup {
--   init_options = {
--     cache = {
--       directory = ".ccls-cache";
--     };
--   }
-- }
-- -- Пример настройки LSP для Rust
lspconfig.rust_analyzer.setup({
    cmd = { "rust-analyzer" }, -- Убедитесь, что `rust-analyzer` доступен в PATH
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
})

-- Telescope
require('telescope').setup()
require('telescope').load_extension('fzf')

-- Auto-save
--require('auto-save').setup()

-- Copy selected text to Windows buffer with "*y
-- vim.g.clipboard = {
--   name = 'win32yank',
--   copy = {
--     ['+'] = 'win32yank.exe -i',
--     ['*'] = 'win32yank.exe -i',
--   },
--   paste = {
--     ['+'] = 'powershell -noprofile -command "Get-Clipboard"',
--     ['*'] = 'powershell -noprofile -command "Get-Clipboard"',
--   },
--   cache_enabled = 0,
-- }
--
-- Autocomplete settings
local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    autocomplete =false, -- Отключить автоматическое появление
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(), -- Вызов меню автокомплита
    ['<C-e>'] = cmp.mapping.abort(), -- Закрыть меню
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
    ['<C-p>'] = cmp.mapping.select_prev_item(), -- Навигация вверх
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Навигация вниз
  },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },  -- Источник из LSP
        { name = 'luasnip' },  -- Источник для сниппетов
    }),
})

-- You don't need to set any of these options.
-- IMPORTANT!: this is only a showcase of how you can set default options!
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

-- Цвет для текущего буфера
-- vim.cmd([[highlight TabLineSel guibg=#282a36 guifg=#ffffff]])

-- Цвет для неактивных буферов
-- vim.cmd([[highlight TabLine guibg=#282a36 guifg=#6272a4]])

-- Цвет для фона панели вкладок
-- vim.cmd([[highlight TabLineFill guibg=#1e1f29]])
--
--

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local parsers = require'nvim-treesitter.parsers'
      return not parsers.has_parser(lang) -- Отключает Treesitter, если парсера нет
    end
  }
}
-- Установка цвета фона для всех режимов
-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#1e1e2e' })      -- Основной режим
-- vim.api.nvim_set_hl(0, 'Insert', { bg = '#1e1e2e' })      -- Режим вставки
-- vim.api.nvim_set_hl(0, 'Visual', { bg = '#45475a' })      -- Визуальный режим (другой цвет для наглядности)
-- vim.api.nvim_set_hl(0, 'Replace', { bg = '#1e1e2e' })     -- Режим замены
-- vim.api.nvim_set_hl(0, 'Command', { bg = '#1e1e2e' })     -- Командный режим
