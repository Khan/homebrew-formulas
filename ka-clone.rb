class KaClone < Formula
  desc "Manages an isolated local gitconfig for cloned repositories"
  homepage "https://github.com/khan/ka-clone"

  url "https://github.com/Khan/ka-clone/archive/v1.1.0.tar.gz"
  sha256 "991195c7fe46ae5a278a0b0164b633a5a95b7ff7c69309abd637454008b2c7f8"
  head "https://github.com/khan/ka-clone.git"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    bin.install "bin/ka-clone"
    prefix.install "templates"
  end

  test do
    system "#{bin}/ka-clone", "--help"
  end
end
