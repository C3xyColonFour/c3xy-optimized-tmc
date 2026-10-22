{
  description = "Nix development shell for https://github.com/C3xyColonFour/c3xy-optimized-tmc";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { nixpkgs, ... }:
  let
     systems = [
        "x86_64-linux" 
        "aarch64-linux" 
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
  in 
  {
    devShells = forAllSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        default = pkgs.mkShellNoCC {
          packages = [
            pkgs.packwiz
          ];
        };
      });
  };
}
