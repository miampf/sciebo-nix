{ appimageTools, fetchurl }:

appimageTools.wrapType2 rec {
  pname = "sciebo-desktop";
  version = "5.3.1.14116";
  src = fetchurl {
    url = "https://install.sciebo.de/sciebo-${version}-x86_64.AppImage";
    sha256 = "04s9mp3ndydqjk5bni52xh14qhdjkjawrlna7rrhqafjqbjm90rb";
  };
}
