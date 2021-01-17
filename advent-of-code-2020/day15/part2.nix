with import <nixpkgs>{};
stdenv.mkDerivation 
{ 
  name = "AOC-Day15-P2";
  src = ./.; 
  buildInputs = [ ghc ]; 
  installPhase = ''
    substituteInPlace ./main.hs --replace '2020' '30000000'
    ghc -O2 ./main.hs && ./main > $out
    echo 'cat result for seeing the result'
  '';
} 
