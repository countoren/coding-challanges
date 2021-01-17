with import <nixpkgs>{};
runCommand "AOC-Day15-P1" { buildInputs = [ ghc ]; } ''
  runghc ${./main.hs} > $out
  echo 'cat result for seeing the result'
''
