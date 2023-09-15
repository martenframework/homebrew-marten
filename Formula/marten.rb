class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.3.3.tar.gz"
  sha256 "bcbbce92fb09ba0bddffb576011628f2705114ecae305edaffd61ccf05135e04"
  version "0.3.3"
  depends_on "crystal"

  def install
    system "shards install --without-development"
    system "mkdir -p bin && crystal build src/marten_cli.cr -o bin/marten"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
