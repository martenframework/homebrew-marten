class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.tar.gz"
  sha256 "5d2f59307470840652aae57b358851e81669c14320a3cecbc47d79ed15ee7673"
  version "0.1.0"
  depends_on "crystal"

  def install
    system "shards install"
    system "mkdir -p bin && crystal build src/marten_cli.cr -o bin/marten"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
