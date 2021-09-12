{ lib, fetchzip }:

let
  version = "3.90";
in 
  fetchzip {
  name = "nishi-teki-font";
#  version = "3.90p";
  url = "https://umihotaru.work/nishiki-teki.zip";
  sha256 = "1xhv2ddzkbr6brg24mkvqhxs4x47pal5yq5l4mh1b3ac2gid4vjx";
  # only extract the variable font because everything else is a duplicate
  postFetch = ''
    mkdir -p $out/share/fonts/truetype/nishikiteki
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype/nishikiteki
  '';

  meta = with lib; {
    maintainers = [ Vertecedoc4545 ];
    platforms = platforms.all;
  };
}
