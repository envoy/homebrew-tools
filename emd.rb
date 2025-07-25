# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Emd < Formula
  desc "Wrapper for mirrord dev tool"
  homepage "https://github.com/envoy/homebrew-tools"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/emd/releases/download/v0.0.3/emd_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "c93de0ccc294fe9997c64fd3e6bc8b6521dc136759888c594acecd39a84cff0a"

      def install
        bin.install "emd"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/emd/releases/download/v0.0.3/emd_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "308bb8b2ab410c20a23026386dfc2c767f9baf1d371ac046a597ab5d3e9e84ea"

      def install
        bin.install "emd"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/emd/releases/download/v0.0.3/emd_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "dc0f1db543f0ea060fb17419775df331a415df3bedfb304639b4c1eb0351e01f"
      def install
        bin.install "emd"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/emd/releases/download/v0.0.3/emd_Linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "d2e0f567e3b76f4a716ffe7794a30f1f4ccdc0b38854c9145285dd2ec632da0d"
      def install
        bin.install "emd"
      end
    end
  end
end
