require "./spec_helper"

describe Marten::Releaser do
  around_each do |t|
    t.run

    Dir.glob("spec/tarballs/*.tar.gz") { |f| File.delete(f) }
    File.delete("spec/Formula/marten.rb")
  end

  describe "::run" do
    it "initializes a new releaser and perform the release operation" do
      Marten::Releaser.run(stdout: IO::Memory.new)

      generated_tarball = nil

      Dir.glob("spec/tarballs/marten-#{Marten::VERSION}*.tar.gz") do |fname|
        generated_tarball = fname
      end

      generated_tarball.should_not be_nil
      File.exists?("spec/Formula/marten.rb").should be_true
    end
  end

  describe "#release" do
    it "creates the tarball as expected" do
      releaser = Marten::Releaser.new(stdout: IO::Memory.new)
      releaser.release

      generated_tarball = nil

      Dir.glob("spec/tarballs/marten-#{Marten::VERSION}*.tar.gz") do |fname|
        generated_tarball = fname
      end

      generated_tarball.should_not be_nil
    end

    it "creates the formula as expected" do
      releaser = Marten::Releaser.new(stdout: IO::Memory.new)
      releaser.release

      generated_tarball = nil

      Dir.glob("spec/tarballs/marten-#{Marten::VERSION}*.tar.gz") do |fname|
        generated_tarball = fname
      end

      sha256_io = IO::Memory.new
      Process.run("shasum -a 256 #{generated_tarball}", shell: true, output: sha256_io, error: STDERR)
      tarball_sha256 = sha256_io.to_s.split(" ").first

      File.exists?("spec/Formula/marten.rb").should be_true

      formula_content = File.read("spec/Formula/marten.rb")
      formula_content.matches?(Regex.new("class Marten < Formula")).should be_true
      formula_content.matches?(Regex.new(%{homepage "http://github.com/martenframework/marten"})).should be_true
      formula_content.matches?(Regex.new(%{sha256 "#{tarball_sha256}"})).should be_true
      formula_content.matches?(Regex.new(%{depends_on "crystal"})).should be_true
    end
  end
end
