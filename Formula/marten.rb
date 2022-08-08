require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20220807192952.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "688727fb5ed927715adb9e433f3a4ee1435faf1884705fff2a78cd3552f8c6ac"
  version "0.1.0.dev0.20220807192952"
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
