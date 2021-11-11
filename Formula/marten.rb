require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211110204131.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "be5b89e1e4515f183f4a030fca3524d596e90c659ada14b6b5953e99f21877d1"
  version "0.1.0.dev0.20211110204131"
  depends_on "crystal"

  def install
    system "make"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
