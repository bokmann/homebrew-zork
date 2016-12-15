require 'formula'

class Jzip < Formula
  homepage 'http://jzip.sourceforge.net/'
  url 'http://download.sourceforge.net/jzip/jzip21-10oct2000.zip'
  sha256 '722a81ee1a9cff51f468dbf38c54a2b149e6cda71e6c540caf4ec4308e290d9d'
  version '2.1'

  def patches
    DATA
  end

  def install
    ENV.delete("SDKROOT")
    system "make -f unixio.mak"

    bin.install "jzip"
    bin.install "jzexe"
    bin.install "ckifzs"
  end

  def test
    system "jzip"
  end
end

__END__
diff --git a/unixio.mak b/unixio.mak
index d6b851a..ccb3082 100644
--- a/unixio.mak
+++ b/unixio.mak
@@ -49,7 +49,7 @@ OPTIMIZE = -O2
 #OPTIMIZE = 
 #OPTIMIZE = -pg -ansi -pedantic
 
-CFLAGS = $(OPTIMIZE) -DPOSIX -DHAVE_GETOPT -DHARD_COLORS -DUSE_ZLIB
+CFLAGS = $(OPTIMIZE) -DPOSIX -DHAVE_GETOPT -DHARD_COLORS
 
 #LIBS = -lcurses
 LIBS = -lz -ltermcap
