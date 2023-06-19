class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.3.0.tar.gz"
  sha256 "fd6ceefa1381ee4f7fb0e2ae23545198779495d31f859c67b842db210c5a61a7"
  version "0.3.0"
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
