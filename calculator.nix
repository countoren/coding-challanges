# nix-build calculator.nix will run the tests. cat result will show the results.
# example: 
# nix-build calculator.nix && cat result 
with import <nixpkgs>{};
runCommand "test" { buildInputs = [ haskellPackages.doctest ]; } ''
  doctest --verbose ${./calculator.hs} &> $out
''
