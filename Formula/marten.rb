class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.2.3.tar.gz"
  sha256 "258e9f07c50e2dbfef4092867b27d366a5ccf7458d8a0aefcc9de9ea0fbca0d0"
  version "0.2.3"
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
