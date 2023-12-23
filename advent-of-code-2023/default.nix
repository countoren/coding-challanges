{ pkgs ? import <nixpkgs> {}
}:
let 
  mainRS = "./main.rs";
  buildRust = name: { rs-file , cargoHash }: with pkgs; ''${rustPlatform.buildRustPackage {
        inherit name cargoHash;
        src = runCommand "${name}-src" {} ''
          mkdir $out
          ln -sf ${rs-file} $out/main.rs
          ln -sf ${./Cargo.lock} $out/Cargo.lock
          ln -sf ${./Cargo.toml} $out/Cargo.toml
        '';
      }}/bin/${(lib.elemAt (lib.importTOML ./Cargo.toml).bin 0).name}'';
in with pkgs; lib.mapAttrs writeShellScriptBin (lib.fix (s:
    #shell scripts 
    (lib.mapAttrs writeShellScript 
    {
      d1 = "cat ${./day1}";
      day1part1 = "${s.d1} | ${s.lastFirstForEachLine}";
      day1part2 = "${s.d1} | ${s.replaceWordsAndLettersTakeMinMaxAndSum} ";

      d2 = "cat ${./day2}";
      d2e = "cat ${./day2example}";

      default = "${s.d2} | ${s.main}";


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
    (lib.mapAttrs buildRust
    {
        replaceWordsAndLettersTakeMinMaxAndSum = { 
          rs-file = ./day1p2.rs; 
          cargoHash = "sha256-tLTay0S6ltB5W4Mz9NKdq+0NqvA8t7zAD9yubThShOg=";
        };
        main = { 
          rs-file = ./main.rs; 
          cargoHash = "sha256-RyE1P45qaqGsKtBzxw5bsKGL13AsfdH7JfWBJVVdQs8=";
        };
    })
  )
)
