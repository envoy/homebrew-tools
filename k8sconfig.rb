# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class K8sconfig < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "0.12.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.12.5/k8sconfig_Darwin_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "59f86f1029ae49fb2296f99918024cc591c58968da1d42fe218f30a863ec4a64"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.12.5/k8sconfig_Darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "a8f029b3102ab05c7ad53dddaad343882dcc732d7a477019465981d1a24796db"

      def install
        bin.install "k8sconfig"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.12.5/k8sconfig_Linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "0c24395753f31a095f95157e289170dcaaf0ca4b2e949904c50a64f73715550d"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.12.5/k8sconfig_Linux_x86_64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "93d53b3dd3f0e7933f26ca92a2f2fc24016c7920edefa1cc2d67bb1b491111b2"

      def install
        bin.install "k8sconfig"
      end
    end
  end
end
