require "marten"

module Marten
  class Releaser
    @formula_version : String? = nil

    def self.run(**kwargs)
      new(**kwargs).release
    end

    def initialize(@stdout : IO = STDOUT)
    end

    def release
      # First generates the Marten tarball.
      stdout.puts "Generating tarball..."
      Process.run(
        "tar --exclude=bin --exclude=lib -czf #{tarball_path} lib/marten -C lib/marten .",
        shell: true,
        output: STDOUT,
        error: STDERR
      )

      # Then generates the formula.
      stdout.puts "Generating formula..."
      File.write(formula_path, ECR.render("#{__DIR__}/templates/marten.rb.ecr"))

      stdout.puts "Done. 🎉"
    end

    private getter stdout

    private def formula_path
      "#{Marten.env.test? ? "./spec/" : "./"}Formula/marten.rb"
    end

    private def formula_sha256
      sha256_io = IO::Memory.new
      Process.run("shasum -a 256 #{tarball_path}", shell: true, output: sha256_io, error: STDERR)
      sha256_io.to_s.split(" ").first
    end

    private def formula_url
      "https://raw.githubusercontent.com/martenframework/homebrew-marten/master/#{tarball_path}"
    end

    private def formula_version
      @formula_version ||= if Marten::VERSION.ends_with?(".dev") || Marten::VERSION.ends_with?(".dev0")
                             "#{Marten::VERSION}.#{Time.local.to_s("%Y%m%d%H%M%S")}"
                           else
                             Marten::VERSION
                           end
    end

    private def tarball_path
      "#{Marten.env.test? ? "spec/" : ""}tarballs/marten-#{formula_version}.tar.gz"
    end
  end
end
