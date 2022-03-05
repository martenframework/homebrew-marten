require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20220304222547.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "dd9cb56706bbeb9337696cb2e7e9aff9409c29e87444a0714acd67200aa712aa"
  version "0.1.0.dev0.20220304222547"
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
