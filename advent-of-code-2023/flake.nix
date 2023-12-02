{
  inputs.vims.url = "github:countoren/vims";
  outputs = { self, nixpkgs, vims }:

  let system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system;};

  in
  {
    packages.${system} = with pkgs; lib.mapAttrs writeShellScriptBin (lib.fix (s:
    #shell scripts 
    (lib.mapAttrs writeShellScript 
    {
      d1 = "cat ${./day1}";
      day1part1 = "${s.d1} | ${s.lastFirstForEachLine}";
      day1part2 = "${s.d1} | ${s.replaceLetters} ";
      default = s.day1part2;
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
        replaceLetters = ''
use std::io::{self, BufRead};

fn main() -> io::Result<()> {
   let stdin = io::stdin();
   let mut handle = stdin.lock();
   let mut buffer = String::new();
   handle.read_line(&mut buffer)?;
   println!("{}", buffer);
   Ok(())
}
        '';
      })
      
      
      

    #end
    ));

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        rustc
        graphviz
        rust-analyzer
        evcxr

        (vims.createNvim {
          inherit pkgs;
          pkgsPath = ".";
          additionalVimrc =  ''
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
