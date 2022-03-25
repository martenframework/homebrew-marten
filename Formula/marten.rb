require_relative "lib/private_strategy"

class Marten < Formula
  desc "CLI client for initializing new Marten projects and applications"
  homepage "http://github.com/martenframework/marten"
  url "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/tarballs/marten-0.1.0.dev0.20220325123102.tar.gz", :using => GitHubPrivateRepositoryDownloadStrategy
  sha256 "e123f35ed8de385a12bb69d41bf854e9e8046e5af63c24e59f8cbd95fa3c617a"
  version "0.1.0.dev0.20220325123102"
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
