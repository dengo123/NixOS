{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    # === Editor-Optionen ===
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      swapfile = false;
      termguicolors = true;
      winblend = 20;
      pumblend = 20;
    };

    globals = {
      mapleader = " ";
      background = "light";
    };

    autoCmd = [
      { event = "ColorScheme"; command = "highlight Normal guibg=NONE ctermbg=NONE"; }
      { event = "ColorScheme"; command = "highlight NonText guibg=NONE ctermbg=NONE"; }
      { event = "ColorScheme"; command = "highlight LineNr guibg=NONE"; }
      { event = "ColorScheme"; command = "highlight Folded guibg=NONE"; }
      { event = "ColorScheme"; command = "highlight EndOfBuffer guibg=NONE"; }
    ];

    # === Plugins ===
    plugins = {
      # Autocompletion & Snippets
      cmp-nvim-lsp.enable = true;
      luasnip.enable = true;
      cmp-luasnip.enable = true;
      friendly-snippets.enable = true;
      nvim-cmp = {
        enable = true;
        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          mapping = {
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.abort()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
          ];
        };
      };

      # LSP, Mason & Formatierung
      mason.enable = true;
      mason-lspconfig.enable = true;
      nvim-lspconfig = {
        enable = true;
        servers = {
          tsserver.enable = true;
          solargraph.enable = true;
          html.enable = true;
          lua-ls.enable = true;
        };
      };

      none-ls = {
        enable = true;
        sources.formatting = {
          stylua.enable = true;
          black.enable = true;
          prettier.enable = true;
        };
      };

      # Debugging (DAP)
      dap.enable = true;
      dap-ui.enable = true;

      # Datei-Browser
      neo-tree = {
        enable = true;
        settings = {
          filesystem = {
            follow_current_file = true;
            group_empty_dirs = true;
            hide_dotfiles = false;
          };
        };
      };

      # Indentation Guides
      indent-blankline.enable = true;

      # Icons für UI
      nvim-web-devicons.enable = true;

      # Statusline
      lualine = {
        enable = true;
        settings.options = {
          theme = "auto";
          component_separators = { left = ""; right = ""; };
          section_separators = { left = ""; right = ""; };
        };
      };

      # Fuzzy Finder (Telescope)
      telescope = {
        enable = true;
        extensions = {
          "ui-select".enable = true;
        };
      };

      # Startbildschirm (Alpha-Nvim)
      alpha = {
        enable = true;
        layout = [
          {
            type = "text";
            opts = { position = "center"; };
            val = [
              "                                                                       "
              "                                                                       "
              "                                                                       "
              "                                                                       "
              "                                                                     "
              "       ████ ██████           █████      ██                     "
              "      ███████████             █████                             "
              "      █████████ ███████████████████ ███   ███████████   "
              "     █████████  ███    █████████████ █████ ██████████████   "
              "    █████████ ██████████ █████████ █████ █████ ████ █████   "
              "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
              " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
              "                                                                       "
              "                                                                       "
              "                                                                       "
            ];
          }
          {
            type = "group";
            val = [
              { key = "e"; desc = "  New File"; action = ":ene <BAR> startinsert <CR>"; }
              { key = "f"; desc = "󰱼  Find File"; action = ":Telescope find_files<CR>"; }
              { key = "r"; desc = "󰄉  Recent"; action = ":Telescope oldfiles<CR>"; }
              { key = "q"; desc = "  Quit"; action = ":qa<CR>"; }
            ];
          }
          {
            type = "text";
            opts = { position = "center"; };
            val = [
              "┳┓┓┏  ┏┳┓┓┏┏┓  ┓ ┏┏┓┓┏"
              "┣┫┗┫   ┃ ┣┫┣   ┃┃┃┣┫┗┫"
              "┻┛┗┛   ┻ ┛┗┗┛  ┗┻┛┛┗┗┛"
            ];
          }
        ];
      };

      # Syntax-Highlighting (Treesitter)
      treesitter = {
        enable = true;
        settings = {
          auto_install = true;
          highlight.enable = true;
          indent.enable = true;
        };
      };
    };

    # === Keybindings ===
    keymaps = [
      { mode = "n"; key = "<leader>h"; action = ":nohlsearch<CR>"; }
      { mode = "n"; key = "<C-h>"; action = ":wincmd h<CR>"; }
      { mode = "n"; key = "<C-l>"; action = ":wincmd l<CR>"; }
      { mode = "n"; key = "<C-k>"; action = ":wincmd k<CR>"; }
      { mode = "n"; key = "<C-j>"; action = ":wincmd j<CR>"; }
      { mode = "n"; key = "<C-t>"; action = ":tabnew<CR>"; }
      { mode = "n"; key = "<C-n>"; action = ":tabnext<CR>"; }
      { mode = "n"; key = "<C-b>"; action = ":tabprevious<CR>"; }
      { mode = "n"; key = "<C-w>"; action = ":tabclose<CR>"; }
    ];
  };
}

