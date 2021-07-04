{ jdk ? "jdk11" }:
with import <nixpkgs>{};
mkShell {
  buildInputs = [ 
    figlet 
    pkgs.coursier
    pkgs.${jdk}
    pkgs.sbt
    pkgs.scala
    # hie
    (vscode-utils.vscodeEnv (vscode-addPersonalConfig {
      mutableExtensionsFile = ./extensions.nix;
      nixExtensions = [
      ];
      })
    )
  ];
}
