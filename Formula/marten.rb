class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.3.1.tar.gz"
  sha256 "f40b529c865c0633dc157390874c278fef33c686d14a21f7c8ff82892abeae84"
  version "0.3.1"
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
