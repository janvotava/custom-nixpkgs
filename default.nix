{ pkgs }:
{
  elasticsearch-8 = pkgs.callPackage ./elasticsearch/8.x.nix { };
}
