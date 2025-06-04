
{ pkgs ? import <nixpkgs> {} }:

rec {
  build = {
    x86_64-linux = pkgs.stdenv.mkDerivation {
      name = "flask-app";
      version = "0.1.0";
      src = ./.;
      
      buildInputs = with pkgs; [
        python3
        python3Packages.flask
      ];
      
      installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/src
        cp -r src/* $out/src/
        
        cat > $out/bin/flask-app <<EOF
        #!/bin/sh
        export PYTHONPATH=$PYTHONPATH
        ${pkgs.python3}/bin/python $out/src/main.py
        EOF
        
        chmod +x $out/bin/flask-app
      '';
    };
  };
}
