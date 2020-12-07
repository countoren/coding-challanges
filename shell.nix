{ ghcVersion ? "ghc882" }:
with import <nixpkgs>{};
let 
  haskellPackages = (hp: with hp; [ 
    split 
    lens
    transformers
    mtl
    text
    vector
    random
    parsec
    megaparsec
    hspec-megaparsec
    attoparsec
    hspec-attoparsec
    regex-pcre
    regex-tdfa
    regex-posix
    hspec
    # hspec-codewars
    hspec-contrib
    HUnit-approx
    haskell-src-exts
  ]);
  ghc = haskell.packages.${ghcVersion}.ghcWithHoogle haskellPackages;
  # hie = ((import (fetchTarball "https://github.com/infinisil/all-hies/tarball/09ba836904fa290b5e37d5403150ea0c921661fb") {})
  #   .selection { selector = p: { ${ghcVersion} = p.${ghcVersion}; }; });
in 
mkShell {
  buildInputs = [ 
    figlet 
    ghc 
    # hie
    (vscode-utils.vscodeEnv (vscode-addPersonalConfig {
      mutableExtensionsFile = ./extensions.nix;
      nixExtensions = [
        { name = "haskell"; publisher = "haskell"; version = "1.2.0"; sha256 = "0vxsn4s27n1aqp5pp4cipv804c9cwd7d9677chxl0v18j8bf7zly";  }
        { name = "language-haskell"; publisher = "justusadam"; version = "3.3.0"; sha256 = "1285bs89d7hqn8h8jyxww7712070zw2ccrgy6aswd39arscniffs";  }
      ];
      })
    )
  ];
}
