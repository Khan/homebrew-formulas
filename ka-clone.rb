class KaClone < Formula
  desc "Manages an isolated local gitconfig for cloned repositories"
  homepage "https://github.com/khan/ka-clone"

  url "https://github.com/Khan/ka-clone/archive/v1.0.4.tar.gz"
  sha256 "d33e9753ad15ad31af920541a64590f5a560ebbb0847aabeef19c6d04dbc0f70"
  # the revision should be omitted (default 0) unless you want to force a
  # reinstall without a corresponding version bump, see: http://git.io/vm4VO
  # revision 0

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
