class GitBigfile < Formula
  desc "A fork of git-bigfile with modifications needed for Khan Academy"
  homepage "https://github.com/Khan/git-bigfile"
  head "https://github.com/Khan/git-bigfile.git"

  url "https://github.com/Khan/git-bigfile/archive/v0.3.1.tar.gz"
  sha256 "2530f6d54617aa552aa8cbb9fc663993585a2c709c47658f3e7573bca9f25669"
  # example of doing this via git checkout instead is below, but using archives
  # is preferred when possible as one can provide expected checksum to verify
  # download security/integrity.
  #url "https://github.com/Khan/git-bigfile.git", :using => :git, :tag => "v0.3.1"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    bin.install "bin/git-bigfile"
    prefix.install "gitbigfile"
    prefix.install "vendor"
  end

  test do
    # simplest test possible would be making sure program doesn't crash with -h
    system("#{bin}/git-bigfile", "--help")

    # verify our packaging is sane by making sure packaged binary reports the
    # same version number as homebrew is using.
    # (note: git-bigfile is strange in that it reports version to STDERR)
    assert_equal version.to_s, `#{bin}/git-bigfile --version 2>&1`.strip
  end
end
