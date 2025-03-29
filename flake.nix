{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.x86_64-linux.default = pkgs.python3Packages.buildPythonApplication {
      pname = "main.py";
      version = "0.1.0";

      propagatedBuildInputs = with pkgs.python3Packages; [
        flask
      ];

      src = ./.;
    };
  };
}
