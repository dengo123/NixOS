{ lib, ... }:

{
  programs.nixvim = {
    config = {
      plugins = {
        trouble = {
          enable = true;
          settings = {
            auto_open = false;
            auto_close = false;
            auto_preview = true;
            use_icons = true;
          };
        };

        gitsigns = {
          enable = true;
          settings = {
            signs = {
              add = { text = "│"; };
              change = { text = "│"; };
              delete = { text = "_"; };
              topdelete = { text = "‾"; };
              changedelete = { text = "~"; };
            };
          };
        };

        noice = {
          enable = true;
          settings = {
            lsp.progress.enabled = true;
            messages.enabled = true;
            notify.enabled = true;
            cmdline.enabled = true;
            views.cmdline_popup.border.style = "rounded";
            presets = {
              bottom_search = true;
              command_palette = true;
              long_message_to_split = true;
            };
          };
        };

        notify.enable = true;
      };

      keymaps = [
        {
          mode = "n";
          key = "]d";
          action = "<cmd>lua vim.diagnostic.jump({ forward = true })<CR>";
          options.desc = "Diagnostic: nächste Meldung";
        }
        {
          mode = "n";
          key = "[d";
          action = "<cmd>lua vim.diagnostic.jump({ forward = false })<CR>";
          options.desc = "Diagnostic: vorherige Meldung";
        }
        {
          mode = "n";
          key = "gl";
          action = "<cmd>lua vim.diagnostic.open_float()<CR>";
          options.desc = "Diagnostic: aktuelle Meldung anzeigen";
        }
        {
          mode = "n";
          key = "<leader>td";
          action = "<cmd>Trouble diagnostics<CR>";
          options.desc = "Trouble: LSP-Diagnosen anzeigen";
        }
        {
          mode = "n";
          key = "<leader>tq";
          action = "<cmd>Trouble quickfix<CR>";
          options.desc = "Trouble: Quickfix anzeigen";
        }
        {
          mode = "n";
          key = "<leader>tl";
          action = "<cmd>Trouble loclist<CR>";
          options.desc = "Trouble: Location-List anzeigen";
        }
      ];

      extraConfigLua = lib.mkBefore ''
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
        })
      '';
    };
  };
}

