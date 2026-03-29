class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.6.3.tar.gz"
  sha256 "778685f6ad4f08bd2c8e4b9225a68e993c93f2cf0fcf39992dde022b15f1aa6a"
  version "0.6.3"
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
