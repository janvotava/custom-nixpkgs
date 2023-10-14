{
  description = "Custom Nix packages";

  outputs = { self, nixpkgs }:
    let
      # pkgs = nixpkgs.legacyPackages.${system};
      forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
      pkgs = forAllSystems (system: (nixpkgs.legacyPackages.${system}));
      elasticsearch-8 = pkgs.callPackage ./elasticsearch/8.x.nix { };
    in
    {

      packages = forAllSystems (system: (nixpkgs.legacyPackages.${system}.callPackage ./default.nix { }));


      # packages.x86_64-linux.elasticsearch-8 = elasticsearch-8;
      # packages.x86_64-darwin.elasticsearch-8 = elasticsearch-8;
      # packages.aarch64-linux.elasticsearch-8 = elasticsearch-8;
      # packages.aarch64-darwin.elasticsearch-8 = elasticsearch-8;

    };
}
