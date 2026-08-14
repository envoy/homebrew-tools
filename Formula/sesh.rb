require_relative "../lib/private_strategy"

class Sesh < Formula
  desc "Discovery-based switcher for AI coding sessions"
  homepage "https://github.com/envoy/sesh"
  url "https://github.com/envoy/sesh/releases/download/v0.1.0/sesh-0.1.0.tar.gz",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "5b55287b96c0c336b3a81a1d75817118f81cea1773b23548560d9bde467a5dc6"
  license "MIT"

  # One Node file, nothing to compile and nothing to vendor.
  depends_on "node"

  # Resolved at runtime, not required to install:
  #   tmux / zellij     — jumping to a session, and opening new windows
  #   terminal-notifier — desktop alerts when a session finishes
  # Without them that one feature is skipped; everything else still works.

  def install
    bin.install "sesh"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      sesh installs from a PRIVATE Homebrew tap, so `brew install` needs a
      GitHub token with `contents:read` exported before you install:

        export HOMEBREW_GITHUB_API_TOKEN=<your-token>

      Just run it — there is nothing to configure first, and sessions you
      started before installing it are already listed:

        sesh

      The first run asks one question: which agent and model new sessions
      should use. Change it any time with `n` then `s` in the picker.

      Full detail (status, cost, search, resume) comes from Claude Code's own
      logs. Other agents are discovered from the process table and listed with
      their directory and idle time, but their conversations are not parsed.
    EOS
  end

  test do
    # --json needs no tty and exits 0 with a JSON array even when nothing is
    # running, so this passes on a clean CI box.
    output = shell_output("#{bin}/sesh --json")
    assert_match(/^\[/, output.strip)
  end
end
