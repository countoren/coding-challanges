{ pkgs ? import <nixpkgs> {}
, pathFromProjRoot ? "."
, commands ? import ./default.nix { inherit pkgs pathFromProjRoot; }
, vims
}:
let 
  mainRS = "main.rs";
in
pkgs.mkShell {
      buildInputs = with pkgs; [
        (builtins.attrValues commands)
        rustc
        cargo
        graphviz
        rust-analyzer
        evcxr
        gcc

        (vims.createNvim {
          inherit pkgs;
          pkgsPath = "./advent-of-code-2023";
          additionalVimrc =  ''
              exe "cd ${pathFromProjRoot}"
              exe "e ${mainRS}"
              exe "sp | terminal repl"

            let g:LanguageClient_serverCommands['rust'] = ['rust-analyzer']

              luafile ${pkgs.writeText "rustConf" ''
              local rt = require("rust-tools")


rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})''}
          '';
          additionalPlugins = with pkgs.vimPlugins; [
            nvim-lspconfig
            rust-tools-nvim
            plenary-nvim
          ]; 
        })
      ];
    }
	
