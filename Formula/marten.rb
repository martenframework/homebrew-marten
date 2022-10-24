class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.tar.gz"
  sha256 "8b9a33eef36ce7319a8ac5af65c6190afac0ea9c9327fc7c8e0b56a401c14b2d"
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
