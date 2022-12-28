# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Eta < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "1.0.3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.3/eta_1.0.3_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "9cc6d5af65e0ee2195b2e05ce6922035cb256cc7d1ad622e7c0253a97742a18f"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/eta/releases/download/v1.0.3/eta_1.0.3_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "4c58ad83d072d184c9a65c0a6bccc5f984316607b3857ce6fd5a7f61e9e29db9"

      def install
        bin.install "eta"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/eta/releases/download/v1.0.3/eta_1.0.3_Linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "8b75f8ef9c1b8fefd00d36ca13dde130adb9e2b81f0494761100601775c4b4b7"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.3/eta_1.0.3_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "4bffe9228ccd0a8594cec1ba8f5a1719bfbe097877916ca45c2d3d87249e575e"

      def install
        bin.install "eta"
      end
    end
  end
end
