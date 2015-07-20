class KhanLinter < Formula
  desc "Lint and code-munging tools for Khan Academy codebase"
  homepage "https://github.com/Khan/khan-linter"
  head "https://github.com/Khan/khan-linter.git"

  url "https://github.com/Khan/khan-linter/archive/v1.1.1.tar.gz"
  sha256 "3cb4e8efaebc36b2c98d02f19faffc00bf037cba7909d3065eca93a8437a7b43"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    # this one is tricky to package via homebrew, because it contains a whole
    # mess of library files just sitting around in a root directory, mixed
    # with repo specific stuff.
    #
    # we can't easily change the file structure of that repo either, because
    # there are still legacy places across the codebase that expect the files to
    # live in a certain place, and hardcode that path.

    # first, lets get all the library/executable files that live in root
    root_files = [
      "compile_jsx_file",
      "githook.py",
      "hook_lib.py",
      "jshint_reporter.js",
      "jshintrc",
      "linters.py",
      "runlint.py",
      "static_content_refs.py",
      "util.py"
    ]
    root_files.each { |f| prefix.install f }

    # the external python/node deps are vendored, so just install those
    prefix.install "vendor"
    prefix.install "node_modules"

    # the "bin" execs are actually symlinks to executable python lib files,
    # so create those symlinks rather than copying so that they point to
    # the installed versions in the Keg.
    bin.install_symlink prefix/"runlint.py" => "ka-lint"
    bin.install_symlink prefix/"githook.py" => "_ka-commit-lint"
  end

  def caveats
    <<-EOS.undent
      Many places in the Khan Academy codebase still hardcode the path to
      khan-linter, which won't work if you are using this Homebrew installed
      version! 💩

      If you see errors that can't find "~/khan/devtools/khan-linter/runlint.py",
      you should update that script to simply use "ka-lint" picked up from the
      global system path instead.
    EOS
  end

  test do
    system "#{bin}/ka-lint", "--help"
  end
end
