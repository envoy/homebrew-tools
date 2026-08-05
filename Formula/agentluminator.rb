require_relative "../lib/private_strategy"

class Agentluminator < Formula
  desc "agentluminator canonical Rust binary — hook entry points + operator surface"
  homepage "https://github.com/envoy/agentluminator"
  version "2.17.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-aarch64-apple-darwin.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "2e142113a759afcf2470b8daa8295c9652d6bee76275ffd70f8710cca285836b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-x86_64-apple-darwin.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "54f66345aee8dd767c16694dba162c3521caf081eec569a569c5249e319c5241"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-aarch64-unknown-linux-gnu.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "0c2b9253f7f6d8996960697869702f2ad39804c7f92bb4b019f65dcd782a8ab2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/agentluminator/releases/download/v2.17.0/agentluminator-x86_64-unknown-linux-gnu.tar.xz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
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
  # >>> agentluminator caveats (injected by apply-homebrew-private-strategy.py) >>>
  def caveats
    <<~EOS
      agentluminator installs from a PRIVATE Homebrew tap, so `brew install`
      needs a GitHub token with `contents:read` exported before you install:

        export HOMEBREW_GITHUB_API_TOKEN=<your-token>

      First run — wire the Claude Code hooks and start the supervised daemon.
      Either run the setup command:

        agentluminator setup hooks install

      ...or just launch a session with the short alias, which self-heals the
      hook wiring and the daemon launchd plist automatically on first run:

        al

      `al` is the short launch alias created by this formula.

      Verify your install at any time with:

        agentluminator doctor
    EOS
  end
  # <<< agentluminator caveats <<<

  # >>> agentluminator post_install (injected by apply-homebrew-private-strategy.py) >>>
  def post_install
    # Best-effort: bring an existing install current on upgrade. This must
    # never abort the brew install (missing user env, fresh install, etc.),
    # so any failure is swallowed. It deliberately does NOT wire hooks or load
    # launchd — Homebrew discourages writing to ~/.claude or loading launchd
    # from post_install, and post_install may lack the user's env. That work is
    # left to the launch self-heal (`al`) + the caveats above.
    system bin/"agentluminator", "install-payload", "reconcile"
  rescue StandardError => e
    opoo "agentluminator: install-payload reconcile skipped: #{e}"
  end
  # <<< agentluminator post_install <<<

end
