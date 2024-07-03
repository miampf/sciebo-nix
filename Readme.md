# Sciebo packaged for nix

The [sciebo desktop app](https://hochschulcloud.nrw/) packaged with nix. You
should be able to install it by adding
`inputs.sciebo-nix.url = "https://github.com/miampf/sciebo-nix";` to your flake.
After that, use `nixpkgs.overlays = [ sciebo-nix.overlays.default ];`. Now you
should have `pkgs.sciebo-desktop` available and ready for install.

**A NOTE ON WAYLAND:**

I had some problems with wayland and qt. For me, setting `QT_QPA_PLATFORM="xcb"`
resolved that issue.
