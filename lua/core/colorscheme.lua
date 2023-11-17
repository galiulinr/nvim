if not vim.opt.termguicolors then
    vim.opt.termguicolors = true
end

--vim.opt.background=dark

function SetColorScheme(color)
  --color = color or "desert"
  --vim.cmd.colorscheme(color)
  
  local status, _ = pcall(vim.cmd, "colorscheme "..color)
  if not status then
	    print("Colorscheme not found, defaulting to builtin")
        vim.cmd([[colorscheme desert]])
	    return
  end

 --vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
 --vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
 --vim.api.nvim_set_hl(0, "ColorColumn", {bg = "none"})
 --vim.api.nvim_set_hl(0, "LineNr", {bg = "none"})
end

SetColorScheme('monokai-pro-classic')
