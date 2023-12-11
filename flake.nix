{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.vims.url = "github:countoren/vims";
  outputs = { self, nixpkgs, vims }:

  let system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system;};
  mainRS = "advent-of-code-2023/main.rs";

  in
  {
    packages.${system} = with pkgs; lib.mapAttrs writeShellScriptBin (lib.fix (s:
    #shell scripts 
    (lib.mapAttrs writeShellScript 
    {
      d1 = "cat ${./advent-of-code-2023/day1}";
      day1part1 = "${s.d1} | ${s.lastFirstForEachLine}";
      day1part2 = "${s.d1} | ${s.replaceWordsAndLettersTakeMinMaxAndSum} ";
      default = s.day1part2;

      #utils
      edit = ''
        nix develop -c -- neovide 
      '';

      utils-rs-main = ''
        echo $(${s.utils-projFolder})/${mainRS}
      '';

      compile = ''
        rustc $(${s.utils-rs-main})
      '';
      watch = ''
        ls $(${s.utils-rs-main}) | ${pkgs.entr}/bin/entr -s ${s.compile}
      '';
      repl = ''
        ${s.utils-rust-create-repl-prelude} && \
        nix develop -c evcxr
      '';
      utils-projFolder = ''${git}/bin/git rev-parse --show-toplevel'';

      utils-rust-create-repl-prelude = ''
        mkdir -p ~/.config/evcxr
        ln -sf $(${s.utils-rs-main}) ~/.config/evcxr/prelude.rs
      '';
    }) //
    #haskell scripts
    (lib.mapAttrs (k: writers.writeHaskell k {})
    {
      lastFirstForEachLine = ''
          import Data.Char (isDigit)
          main = interact $ show . sum . map (f . (filter isDigit)) . lines
          f :: String -> Int
          f s = read $ (take 1 s) ++ (take 1 (reverse s))
      '';
    }) //
    #rust scripts
    (lib.mapAttrs (k: writers.writeRust k {})
    {
        replaceWordsAndLettersTakeMinMaxAndSum = builtins.readFile ./advent-of-code-2023/day1p2.rs;
    })
      

    #end
    ));


    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        (builtins.attrValues self.packages.${system})
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
              exe "e ${mainRS}"
              exe "sp | terminal repl"
              exe "sp | terminal watch"

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
    };
  };
}
