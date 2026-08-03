require_relative "../lib/private_strategy"

class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.8.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.8.0/agentluminator-aarch64-apple-darwin.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "295719fc60c75816fb3be42e89d6a777ba4976b2a820d0c323a9a4051291897b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.8.0/agentluminator-x86_64-apple-darwin.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "c128757d6ba76d825c72f4a1f786d3aab7ae718332090a0a50ad599a7a8a4a83"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.8.0/agentluminator-aarch64-unknown-linux-gnu.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "03733fc0672d8c2e025a1657d48238170095eef963ad5de3f0279ca5f75138a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.8.0/agentluminator-x86_64-unknown-linux-gnu.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "5da8f182252650324e8aac91d626fd31e4b4e6c328b60c87c8c67982b78ea65e"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "agentluminator" if OS.mac? && Hardware::CPU.arm?
    bin.install "agentluminator" if OS.mac? && Hardware::CPU.intel?
    bin.install "agentluminator" if OS.linux? && Hardware::CPU.arm?
    bin.install "agentluminator" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
