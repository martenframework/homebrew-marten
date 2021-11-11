require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211110203551.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "1652f8def4f78e625777ee9e03fddd46a4058cc7af94c642ff7fd0c7464d576a"
  version "0.1.0.dev0.20211110203551"
  depends_on "crystal"

  def install
    system "make"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
