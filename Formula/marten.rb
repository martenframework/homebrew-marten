class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://github.com/martenframework/homebrew-marten/raw/master/tarballs/marten-0.1.0.dev0.20211109211506.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "ad467b8ef6ac36a753fd15369290480e3cfd972952d55fedd203c2fcfeca9213"
  version "0.1.0.dev0.20211109211506"
  depends_on "crystal"

  def install
    system "make install"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
