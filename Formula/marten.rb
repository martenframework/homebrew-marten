require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20220421192450.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "9796a95a5ffc3030ebada90878546fa4abd6fe021dffec4ae9d0599c7c1d2b4f"
  version "0.1.0.dev0.20220421192450"
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
