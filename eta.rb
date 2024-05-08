# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Eta < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "1.1.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.1.5/eta_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "cee03c563999da170bca5a5bf93e4246bbae5d0dd3b944ec5afe82b5aa16969f"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/eta/releases/download/v1.1.5/eta_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "5c961d6ba51fa3ccb2855439950e16a4129c48d97b13768704798ce6e3df02c7"

      def install
        bin.install "eta"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.1.5/eta_linux_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "50d8e73a7a0d5a23b44befe11b49fa1e686229a17e5514560a9cf54fb422b2ca"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/eta/releases/download/v1.1.5/eta_linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "fd7256c03a385143ba07aaad665f31bac878b90d8f47cca126a76464486e3685"

      def install
        bin.install "eta"
      end
    end
  end
end
