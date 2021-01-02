{ pkgs ? import <nixpkgs> {} }:
with pkgs;
let
commands = 
 lib.attrValues (lib.fix (self: lib.mapAttrs writeShellScript
   ({
      aoc-input = ''cat ${./day1Input}'';

    })
  )
);
commandsBin = runCommand "commands" {} 
  ''
    mkdir -p $out/bin
    ${lib.concatMapStringsSep " " (c: ''
      ln -nfs ${c} $out/bin/${c.name}
    '') commands}
  '';
in runCommand "AOC" {
    buildInputs = [ figlet commandsBin];
    shellHook = ''
      figlet 'AOC - Day 1'
    '';
  }
  ''
    d1-input > $out
  ''
