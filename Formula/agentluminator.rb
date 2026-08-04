class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.13.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.13.0/agentluminator-aarch64-apple-darwin.tar.xz"
      sha256 "ff5a0c3eba727f99e28db8d8e9ea8a7bcb968860d5ee739fcedd3f2354a130bd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.13.0/agentluminator-x86_64-apple-darwin.tar.xz"
      sha256 "bd927663c7b4b665bc89fb7371ba6aa53cc9a72134c8f17d0dfde45964f03767"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.13.0/agentluminator-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0e1dc2da2642a64e2fe2027e5ece317f52d5f0f64e9658917cac5840ca20b2d4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.13.0/agentluminator-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "158ab5c54b183f28d506ec7b278d691825ed9b822a73f9c158b1b70de028c00f"
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
