class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.19.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.1/agentluminator-aarch64-apple-darwin.tar.xz"
      sha256 "3152a906102c5328767130991361c3645f0a5ee2ca7b49b751d7adbcb2050a4a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.1/agentluminator-x86_64-apple-darwin.tar.xz"
      sha256 "3ae86e772c8547d0c670d38e94626356037c1e1242f3a073619634382148fd85"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.1/agentluminator-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c6ca63291159ffba6a3c93e7284b45f4c06f1519c40f85dfc66d7a4d17b24679"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.19.1/agentluminator-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b402f0ed7be64b7f3c72b16a9e84aba73f03914075959461b11b8a0a85d7dedd"
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
