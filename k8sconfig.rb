# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class K8sconfig < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.13.1/k8sconfig_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "cfb8f0c702d16a7404e25a5cdd97d7fdfbd46cf225d3b135b71fbaacad1129cc"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.13.1/k8sconfig_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "a815911e73308e924f01e3731e32d74493e6129f9eab56cb9f8a7eb635b70a6a"

      def install
        bin.install "k8sconfig"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.13.1/k8sconfig_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "8a3c27d5154b50e5da633d1ffe2ce44295281c20568dbf80b37e440defc49267"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.13.1/k8sconfig_Linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "38212456c8fc881d62bc6e06c3f7c57d245ed5b17886c3bb10e8209dd659c882"

      def install
        bin.install "k8sconfig"
      end
    end
  end
end
