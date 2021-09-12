
{ lib, fetchurl, ... }:

let
  pname = "Koruri";
  version = "20210720";
in fetchurl {
  name = "${pname}-${version}";
  url = "https://github.com/Koruri/Koruri/releases/download/${version}/Koruri-${version}.tar.xz";
  downloadToTemp = true;
  recursiveHash = true;
  postFetch = ''
    mkdir Koruri
    tar xf $downloadedFile -C Koruri
    cd Koruri
    mkdir -p $out/share/fonts/truetype/Koruri/
    install -D ./*.ttf $out/share/fonts/truetype/Koruri
  '';

  sha256 = "16y9jysrb4a8m26gv8x1by63smindsyhk59yzyyxlq3d1ny9q470";
  meta = with lib; {
    description = "Japanese TrueType font obtained by mixing mplus and Open Sans";
    homepage = "https://koruri.github.io";
    license = licenses.free;
    maintainers = with maintainers; [ Vertecedoc4545 ];
    platforms = platforms.all;
  };
}
