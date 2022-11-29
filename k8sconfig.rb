# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class K8sconfig < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.6.0/k8sconfig_0.6.0_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "0e1d59191346fbd117504ddb04b7db81ecfc4977fe481d53ab946d8e9dd0339b"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.6.0/k8sconfig_0.6.0_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "00af78d5e5091581da3d5996c206d82b4b47861c50ce3a90acfaf887e66b3ef8"

      def install
        bin.install "k8sconfig"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.6.0/k8sconfig_0.6.0_Linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "0a7993044a5220d60f321481ac35f85858d04a54072706323632f402ad90f602"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.6.0/k8sconfig_0.6.0_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "49764e4485443801235f55f8e9a6cb3ea9312d407ce17d1430b330abe8e242be"

      def install
        bin.install "k8sconfig"
      end
    end
  end
end
