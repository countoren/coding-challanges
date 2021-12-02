with import <nixpkgs>{};
mkShell {
  name = "open-knights-tour-problem";
  buildInputs = [
    (import ~/Dropbox/nixpkgs/vim/hsvim.nix {})
  ];
}
