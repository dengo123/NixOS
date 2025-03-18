{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;

    plugins = {
      cmp-nvim-lsp.enable = true;
      luasnip.enable = true;
      friendly-snippets.enable = true;
      cmp.enable = true;  # ✅ nvim-cmp wurde in cmp umbenannt

      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;  # ✅ tsserver wurde in ts_ls umbenannt
          solargraph.enable = true;
          html.enable = true;
          lua_ls.enable = true;  # ✅ lua-ls wurde in lua_ls umbenannt
        };
      };

      dap.enable = true;
      dap-ui.enable = true;
      neo-tree.enable = true;
      indent-blankline.enable = true;
      web-devicons.enable = true;  # ✅ Korrekte Aktivierung von devicons
      lualine.enable = true;
      telescope.enable = true;
      treesitter.enable = true;

      # ✅ Alpha-Nvim mit deiner Konfiguration
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

      # ✅ Konflikt zwischen ts_ls und prettier gelöst
      none-ls = {
        enable = true;
        sources.formatting = {
          stylua.enable = true;
          black.enable = true;
          prettier = {
            enable = true;
            disableTsServerFormatter = true;
          };
        };
      };
    };

    # 🔹 Extra Lua Konfiguration für nvim-cmp, Neo-Tree & Keybindings
    extraConfigLua = ''
      -- Neo-Tree Setup
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = true,
          group_empty_dirs = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        window = {
          transparent_panel = true,
        },
      })

      -- nvim-cmp Setup
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })

      -- Keybindings
      vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
      vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

      vim.keymap.set("n", "<leader>dt", require("dap").toggle_breakpoint, {})
      vim.keymap.set("n", "<leader>dc", require("dap").continue, {})

      vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", {})
      vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", {})
      vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", {})
      vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", {})

      vim.keymap.set("n", "<C-t>", ":tabnew<CR>", {})
      vim.keymap.set("n", "<C-n>", ":tabnext<CR>", {})
      vim.keymap.set("n", "<C-b>", ":tabprevious<CR>", {})
      vim.keymap.set("n", "<C-w>", ":tabclose<CR>", {})

      vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", {})

      -- Hintergrundfarben für Neo-Tree
      vim.cmd("highlight NeoTreeNormal guibg=NONE ctermbg=NONE")
      vim.cmd("highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE")
      vim.cmd("highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE")
      vim.cmd("highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE")
    '';
  };
}

