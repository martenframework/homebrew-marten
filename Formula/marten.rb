require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20221014082411.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "20d6cc250f21a1b2132cd51bac24b8f37bcf473ff21f393bdb192968950f73ab"
  version "0.1.0.dev0.20221014082411"
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
