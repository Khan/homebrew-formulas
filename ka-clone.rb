class KaClone < Formula
  desc "Manages an isolated local gitconfig for cloned repositories"
  homepage "https://github.com/khan/ka-clone"

  url "https://github.com/Khan/ka-clone/archive/v1.0.2.tar.gz"
  sha256 "153ce8c7900bba546ca31d2ceb7ef5a404e53e7cb414691015e2e7d96275e441"
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
