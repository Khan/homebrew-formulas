class KaGitWorkflow < Formula
  desc "Scripts to enable the git workflow at Khan Academy"
  homepage "https://github.com/Khan/git-workflow"
  head "https://github.com/Khan/git-workflow.git"

  url "https://github.com/Khan/git-workflow/archive/v1.0.0.tar.gz"
  sha256 "f1ca606a94192c8c1f17e42b000638c3ab3921f687d2fefc0d1cc266e25abbec"

  depends_on :python if MacOS.version <= :snow_leopard

  def install
    bin.install "bin/git-deploy-branch"
    bin.install "bin/git-find-reviewers"
    bin.install "bin/git-recursive-grep"
    bin.install "bin/git-review-branch"
  end

  test do
    system "#{bin}/git-find-reviewers", "--help"
  end
end
