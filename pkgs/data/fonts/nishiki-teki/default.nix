{ lib, fetchzip }:

let
  version = "3.90";
in fetchzip {
  name = "nishi-teki";

  url = "http://umihotaru.fool.jp/nishiki-teki.zip";

  # only extract the variable font because everything else is a duplicate
  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype/
  '';

  meta = with lib; {
    maintainers = [ Vertecedoc4545 ];
    platforms = platforms.all;
  };
}
