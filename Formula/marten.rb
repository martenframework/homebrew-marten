require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211109221843.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "5fe0c5567a04b446588a2e72d97612ab6b792852d0b7b11cd46502470bcdea08"
  version "0.1.0.dev0.20211109221843"
  depends_on "crystal"

  def install
    system "make install"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
