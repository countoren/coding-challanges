with import <nixpkgs>{};
mkShell {
  name = "open-knights-tour-problem";
  buildInputs = [
    (import ~/nixpkgs/vim/hsvimLinux.nix {})
  ];
}
