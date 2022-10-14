require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20221013153605.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "06c0e2b7551938c09948335a5216850c61fe07d80accd85f4634e7213cde4696"
  version "0.1.0.dev0.20221013153605"
  depends_on "crystal"

  def install
    system "make"
    system "mkdir -p bin && crystal build src/marten_cli.cr -o bin/marten"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
