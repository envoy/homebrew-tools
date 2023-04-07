# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Eta < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "1.0.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.11/eta_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "7c32af996b4b29c3bbdfc353836509588ebc1f1365c50c6618eb613672650885"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/eta/releases/download/v1.0.11/eta_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "663d64ed3223075029ff9cc2d0ed69538427c094b04b349822d17d4eb610ad74"

      def install
        bin.install "eta"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.11/eta_linux_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "038da44e32fe117ebfdd9175ed8927bb884419dfe829da07760a00d1f100ac4e"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/eta/releases/download/v1.0.11/eta_linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "1546c14c2b7ee1f806f31601de4121d47c2ea3fdd476177785d8a2d48e60a596"

      def install
        bin.install "eta"
      end
    end
  end
end
