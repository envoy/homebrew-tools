# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class K8sconfig < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.1.2/k8sconfig_0.1.2_Darwin_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "f0f96bab44dfafb547dd7bdf101060e90c384952effcc8db96b4c5f064d38bf6"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.1.2/k8sconfig_0.1.2_Darwin_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "83160192be5786bed3e57fb1ce28219e632a035aa910155e3626e9dbac2a2fab"

      def install
        bin.install "k8sconfig"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.1.2/k8sconfig_0.1.2_Linux_arm64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "7010b2a45126b4adcd148ece2f0372224ab03648dddd1496c891bc7e0c31aa20"

      def install
        bin.install "k8sconfig"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/envoy/k8sconfig/releases/download/v0.1.2/k8sconfig_0.1.2_Linux_x86_64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "eee235de1e200c6b74d20f3b41848398b134e65d990dc0f9aa8fc922b8869ccd"

      def install
        bin.install "k8sconfig"
      end
    end
  end
end
