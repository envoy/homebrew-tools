# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Eta < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/envoy/eta/releases/download/v1.0.4/eta_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "c6ff5a4999ae0953b90298021bec22ebe59c23dcb46b5db89be56794b6362479"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.4/eta_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "d098b76f0ff165f5be5e48b6db71e9b23620e36d04be9f8931dff24fa8fd333c"

      def install
        bin.install "eta"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/eta/releases/download/v1.0.4/eta_linux_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "ee6e404da104dde01c9c1586c8f227f4d9868821be52b7c17af77d0df2e7c659"

      def install
        bin.install "eta"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/eta/releases/download/v1.0.4/eta_linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "6289529a3a9b2a8d0f259195f8f887a0fbe32fe6dddd2169c2696cdb9c5f574b"

      def install
        bin.install "eta"
      end
    end
  end
end
