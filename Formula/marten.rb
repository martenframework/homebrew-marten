require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20220703092427.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "906dc9d416bc92f2ad03c2a02cdee005ee89d86f57798959e91e6da391f39b95"
  version "0.1.0.dev0.20220703092427"
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
