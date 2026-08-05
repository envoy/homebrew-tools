class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.17.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-aarch64-apple-darwin.tar.xz"
      sha256 "2e142113a759afcf2470b8daa8295c9652d6bee76275ffd70f8710cca285836b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-x86_64-apple-darwin.tar.xz"
      sha256 "54f66345aee8dd767c16694dba162c3521caf081eec569a569c5249e319c5241"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0c2b9253f7f6d8996960697869702f2ad39804c7f92bb4b019f65dcd782a8ab2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a9a0d9f534e3a366e737a535581d69497dab5b50f31b8a38ae265d9aff52ad0d"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {
      agentluminator: [
        "al",
      ],
    },
    "aarch64-unknown-linux-gnu":         {
      agentluminator: [
        "al",
      ],
    },
    "x86_64-apple-darwin":               {
      agentluminator: [
        "al",
      ],
    },
    "x86_64-unknown-linux-gnu":          {
      agentluminator: [
        "al",
      ],
    },
    "x86_64-unknown-linux-musl-dynamic": {
      agentluminator: [
        "al",
      ],
    },
    "x86_64-unknown-linux-musl-static":  {
      agentluminator: [
        "al",
      ],
    },
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
