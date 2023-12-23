{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.vims.url = "github:countoren/vims";
  outputs = { self, nixpkgs, vims }:

  let system = "x86_64-linux";
  pkgs = import nixpkgs { inherit system;};
  in
  {
    packages.${system} = import ./advent-of-code-2023 { inherit pkgs;};
    devShells.${system}.default = import ./advent-of-code-2023/shell.nix { inherit pkgs;
      commands = self.packages.${system};
    };
  };
}
