rec {
  description = "Shit to deal with Intels NEW protocols";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      rec {
        formatter = pkgs.nixpkgs-fmt;
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            flatpak-builder
          ];
        };
      }
    );
}
