
{
  description = "JIT-Tutorial Mandelbrot set";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
 };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

	in
        {
          default = pkgs.mkShell {
            name = "jit-tutorial";

            packages = with pkgs; [
	    	imagemagick
	    ];

         };
        });
    };
}

