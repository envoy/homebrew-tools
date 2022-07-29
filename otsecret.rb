# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Otsecret < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/envoy/otsecret/releases/download/v0.0.4/otsecret_0.0.4_Darwin_arm64.tar.gz"
      sha256 "37c288ece4762bef60c7864a52609112e8ecfdc6182f9c2ffc379aa7dd989f57"

      def install
        bin.install "otsecret"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/otsecret/releases/download/v0.0.4/otsecret_0.0.4_Darwin_x86_64.tar.gz"
      sha256 "459fdab624950720baaabb94ce28bd24ca52a3591461a59d38c5b8e9a28802c9"

      def install
        bin.install "otsecret"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/otsecret/releases/download/v0.0.4/otsecret_0.0.4_Linux_arm64.tar.gz"
      sha256 "22441978b045564e8ad314b19e459c96938c52b860cf43d31b532498b707a5b7"

      def install
        bin.install "otsecret"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/otsecret/releases/download/v0.0.4/otsecret_0.0.4_Linux_x86_64.tar.gz"
      sha256 "ceeb4c4b863a9f0b7c8847bd8c4625b4e0f24dd82ca41dd27e50e29d39f3acf6"

      def install
        bin.install "otsecret"
      end
    end
  end
end
