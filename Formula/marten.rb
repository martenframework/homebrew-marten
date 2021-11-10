class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://github.com/martenframework/homebrew-marten/raw/master/tarballs/marten-0.1.0.dev0.20211109210417.tar.gz"
  sha256 "29a33f8f66b2e981de49bd45e1f4d3e81704d14b9654ff4b81b1a02f74b55d68"
  version "0.1.0.dev0.20211109210417"
  depends_on "crystal"

  def install
    system "make install"
    bin.install "bin/marten"
  end

  test do
    system "{bin}/marten", "-v"
  end
end
