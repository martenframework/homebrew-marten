require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20211223104920.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "c2619180ec3875e20129e023895c08268a91e38e9ab7488432462c72a245e55f"
  version "0.1.0.dev0.20211223104920"
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
