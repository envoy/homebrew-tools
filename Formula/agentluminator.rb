class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.19.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.2/agentluminator-aarch64-apple-darwin.tar.xz"
      sha256 "44c4dbbd8663666961b61e509741a8433bbcc9114bc8ae777e644852eb49a106"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.2/agentluminator-x86_64-apple-darwin.tar.xz"
      sha256 "7328547e9b31a4092a5c4f0160323cd7d5dc4f846fc10c50a80776c53dbe626a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.2/agentluminator-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "20c2ab9b3f21d32d4d4ca364ada90b06cfabddae93f043aee478e2aa4719553e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.2/agentluminator-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f72457c1669734b6cce9660715e049e4cfc70120465f579bfa46de3a1ae75219"
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
