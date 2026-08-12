class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.19.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.4/agentluminator-aarch64-apple-darwin.tar.xz"
      sha256 "f912b9b9788bf09b5c789ec9e0e8f9d933ef75de4002411af22a9d9d3141b354"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.4/agentluminator-x86_64-apple-darwin.tar.xz"
      sha256 "3bc663250b344358aa08cc61d44781f7fc25cefd97ec5cbcb32fa68aaadb8d08"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.4/agentluminator-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "931f65e56b348f482bbe037c80706e492f784930a9d16b83b2b866e19c7a9bd0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.4/agentluminator-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "566fcf46e99edab181f583a0dadb7e0effffaa03d501e8f0993717c1f2ff4216"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "agentluminator"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "agentluminator"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "agentluminator"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "agentluminator"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
