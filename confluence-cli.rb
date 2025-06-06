# typed: false
# frozen_string_literal: true

require_relative "lib/private_strategy"
class ConfluenceCli < Formula
  desc "Command line interface for Atlassian Confluence"
  homepage "https://github.com/envoy/confluence-cli"
  version "1.3.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/confluence-cli/releases/download/v1.3.2/confluence-cli_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "sha256:97e764e47ba25ffef6098e5b2d0a0954974c1adcf3ae2906bae96f3693da6860"

      def install
        bin.install "confluence"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/confluence-cli/releases/download/v1.3.2/confluence-cli_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "sha256:4cb988ec6ed60a8d1584f7020bf81957f790901c7685cdc51a12482a835359c9"

      def install
        bin.install "confluence"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/envoy/confluence-cli/releases/download/v1.3.2/confluence-cli_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "sha256:274eaa7b78f02bc22a66eaeb673068dc0c1d93b1277ec1de59b98a1264671355"

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
