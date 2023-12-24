{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    vims.url = "github:countoren/vims";
  };
  outputs = { self, nixpkgs, flake-utils, vims }:
  flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
  let
  pkgs = import nixpkgs { inherit system;};
  aoc2023 = "advent-of-code-2023";
  in
  {
    packages = import ./advent-of-code-2023/default.nix { inherit pkgs; pathFromProjRoot = aoc2023; };
    devShells.default = import ./advent-of-code-2023/shell.nix { 
      inherit pkgs vims;
      pathFromProjRoot = aoc2023;
      commands = self.packages.${system};

    };
  });
}
