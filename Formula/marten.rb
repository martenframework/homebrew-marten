require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211113103603.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "ba538b1ef1658edbf7dcc17aac7d6252e125b3eee733a1d2c1c318410066ec2d"
  version "0.1.0.dev0.20211113103603"
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
