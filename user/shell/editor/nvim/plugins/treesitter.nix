{ config, lib, pkgs, ... }:

{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      ensureInstalled = "all";

      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    rainbow-delimiters.enable = true;

    treesitter-textobjects = {
      enable = true;

      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ap" = "@parameter.outer";
          "ip" = "@parameter.inner";
          "ao" = "@conditional.outer";
          "io" = "@conditional.inner";
          "al" = "@loop.outer";
          "il" = "@loop.inner";
          "aa" = "@call.outer";
          "ia" = "@call.inner";
          "ab" = "@block.outer";
          "ib" = "@block.inner";
          "as" = "@statement.outer";
          "is" = "@statement.inner";
          "a/" = "@comment.outer";
          "i/" = "@comment.inner";
        };
      };

      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "]f" = "@function.outer";
          "]c" = "@class.outer";
        };
        gotoPreviousStart = {
          "[f" = "@function.outer";
          "[c" = "@class.outer";
        };
      };

      swap = {
        enable = true;
        swapNext = {
          "<leader>a" = "@parameter.inner";
        };
        swapPrevious = {
          "<leader>A" = "@parameter.inner";
        };
      };

      lspInterop = {
        enable = true;
        border = "single";
        peekDefinitionCode = {
          "<leader>dp" = "@function.outer";
        };
      };
    };
  };

  programs.nixvim.extraConfigLua = lib.mkBefore ''
    -- Treesitter Folding
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    vim.o.foldlevel = 99
    vim.o.foldenable = true
  '';
}

