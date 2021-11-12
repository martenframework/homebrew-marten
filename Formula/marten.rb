require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211111193539.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "39bbbba7f3cef2e1b7742b046d788f262b5d08259c9d903c8f50e7d0d9ee8a0d"
  version "0.1.0.dev0.20211111193539"
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
