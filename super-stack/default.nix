with import <nixpkgs>{};
runCommand "PDT-Super-stack" { buildInputs = [ ghc ]; } ''
  cat ${./input} | runghc ${./main.hs} > $out
  echo 'cat result for seeing the result'
''
