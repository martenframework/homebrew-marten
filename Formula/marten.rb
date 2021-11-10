class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://github.com/martenframework/homebrew-marten/raw/master/tarballs/marten-0.1.0.dev0.20211109210808.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "8c223ec41dae53eb6f03d24b0e592a886891cfb09ee4554fcaebc00094175420"
  version "0.1.0.dev0.20211109210808"
  depends_on "crystal"

  def install
    system "make install"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
