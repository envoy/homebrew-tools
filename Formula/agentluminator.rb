class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.20.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.20.0/agentluminator-aarch64-apple-darwin.tar.xz"
      sha256 "b3d94bae31f9d9eebd1f38b6540d366e76ddb44c0a5386a4c4daa90e86c4813c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.20.0/agentluminator-x86_64-apple-darwin.tar.xz"
      sha256 "6c31fa76dc97797558ef7073c6aa22de149d19b9a661f716b6707210f07845c6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.20.0/agentluminator-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f6d77d5a4aa6258772a7c05576a7e672bc6555d7ff0502a87d5eaf695753f963"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.20.0/agentluminator-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c7d0fa3847094191d20f770e62c7db31d1ac66607b2bf87b91a8ad58b0af5dd4"
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
