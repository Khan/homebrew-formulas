require "formula"

class KaMogenerator < Formula
  homepage "https://github.com/rentzsch/mogenerator"

  head "https://github.com/rentzsch/mogenerator.git", :revision => "258832"

  depends_on :xcode => :build

  def install
    xcodebuild "-target", "mogenerator", "-configuration", "Release","SYMROOT=symroot", "OBJROOT=objroot"
    bin.install "symroot/Release/mogenerator"
  end
end
