{ pkgs, fetchgit, ... }:
let
  inherit (pkgs) libvirt;
  inherit (pkgs) libxml2;
in
{
  schemer = pkgs.buildGoPackage rec {
    pname = "schemer2";
    version = "2";
    vendorHash = null;
    goPackagePath = "https://github.com/thefryscorer/schemer2";
    src = fetchgit {
      url = "https://github.com/thefryscorer/schemer2";
      hash = "sha256-EKjVz4NkxtxqGissFwlzUahFut9UAxS8icxx3V7aNnw=";
    };
    buildInputs = [
      libvirt
      libxml2
    ];
    #nativeBuildInputs = [musl];

    CGO_ENABLED = 1;

    #ldflags = [
    #  "-linkmode external"
    #  "-extldflags '-static -L${musl}/lib'"
    #];
  };
}
