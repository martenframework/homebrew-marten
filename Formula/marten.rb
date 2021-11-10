require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211109223149.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "9a73cab56d34915ecb5495d0465c1dc3dc19d8c1ba8aa75215e84d698931eeae"
  version "0.1.0.dev0.20211109223149"
  depends_on "crystal"

  def install
    system "make"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
