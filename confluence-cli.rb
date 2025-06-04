# typed: false
# frozen_string_literal: true

require_relative "lib/private_strategy"
class ConfluenceCli < Formula
  desc "Command line interface for Atlassian Confluence"
  homepage "https://github.com/envoy/confluence-cli"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/confluence-cli/releases/download/v1.0.0/confluence-darwin-amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "PLACEHOLDER_SHA256_INTEL"

      def install
        bin.install "confluence"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/confluence-cli/releases/download/v1.0.0/confluence-darwin-arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "PLACEHOLDER_SHA256_ARM"

      def install
        bin.install "confluence"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/envoy/confluence-cli/releases/download/v1.0.0/confluence-linux-amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "PLACEHOLDER_SHA256_LINUX"

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