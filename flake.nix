{
  description = "Custom Nix packages";

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
    in
    {
      packages = forAllSystems (system: (nixpkgs.legacyPackages.${system}.callPackage ./default.nix { }));
    };
}
