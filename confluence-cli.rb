# typed: false
# frozen_string_literal: true

require_relative "lib/private_strategy"
class ConfluenceCli < Formula
  desc "Command line interface for Atlassian Confluence"
  homepage "https://github.com/envoy/confluence-cli"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/confluence-cli/releases/download/v1.4.0/confluence-cli_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "46bd8379421d5e20ebf9051674e9b312184894ab9c020ca3e9bb240591c76c96"

      def install
        bin.install "confluence"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/confluence-cli/releases/download/v1.4.0/confluence-cli_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "9a34778d6c39c62682ed7e14fbc3071305a26a8469b9a684de2cdce34f19d229"

      def install
        bin.install "confluence"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/envoy/confluence-cli/releases/download/v1.4.0/confluence-cli_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "5d942012eb8e9c024575b4f3f44341b0862aaca0305adee79490ee85aa3c606c"

        def install
          bin.install "confluence"
        end
      end
    end
  end

  test do
    system "#{bin}/confluence", "version"
  end
end
