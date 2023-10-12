# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Eta < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "1.0.16"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.16/eta_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "d3da5f56c1a965495aaaa8e5e2993a1bd5e07ffbb0fea10b3f4461670f2d9a70"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/eta/releases/download/v1.0.16/eta_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "eb3b1277f9ed4b024509c796759e1106eccd7b2756c445506e0e5ecaf2969105"

      def install
        bin.install "eta"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.16/eta_linux_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "0d3cfa84619400d2ddfc9f11b5501f90b8134beeec3710584ba87755b0f0d7e1"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/eta/releases/download/v1.0.16/eta_linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "83496c83c2a026c65db1eae64ef86d3782e6430da7d82652171242f0c69d8c53"

      def install
        bin.install "eta"
      end
    end
  end
end
