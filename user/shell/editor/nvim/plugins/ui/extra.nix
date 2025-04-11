{ lib, ... }:

{
  programs.nixvim.extraConfigLua = lib.mkAfter ''
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
        vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
        vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
        vim.cmd("highlight VertSplit guibg=NONE ctermbg=NONE")
        vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
        vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
      end,
    })
  '';
}

