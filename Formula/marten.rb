require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20220827181126.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "3601e272b66bd07d194560fc02134ef3e24daf30efb13ea23ac195d79a27cd14"
  version "0.1.0.dev0.20220827181126"
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
