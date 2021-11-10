require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://github.com/martenframework/homebrew-marten/raw/master/tarballs/marten-0.1.0.dev0.20211109212254.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "22644fd62b8972182f9bc911fe5f7d323eecf68543fbf96378c1a0df743c0ef0"
  version "0.1.0.dev0.20211109212254"
  depends_on "crystal"

  def install
    system "make install"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
