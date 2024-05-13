# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "lib/private_strategy"
class Eta < Formula
  desc ""
  homepage "https://github.com/envoy/homebrew-tools"
  version "1.16"

  on_macos do
    on_intel do
      url "https://github.com/envoy/eta/releases/download/v1.16/eta_darwin_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "96ccb102d0e394a3c40a22d254a4fd574398736b5214aa2fe1b912d68aaf9db4"

      def install
        bin.install "eta"
      end
    end
    on_arm do
      url "https://github.com/envoy/eta/releases/download/v1.16/eta_darwin_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
      sha256 "01fef7449c04692c4212e1630b0fa1ef80373a4f1ecf71adcfe37e743da3a274"

      def install
        bin.install "eta"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/envoy/eta/releases/download/v1.16/eta_linux_amd64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "ef5ac1a97bcb20acb1d2a002dc74691da9fe1af1fc1343333fecd873f2bf5392"

        def install
          bin.install "eta"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/envoy/eta/releases/download/v1.16/eta_linux_arm64.tar.gz", using: GitHubPrivateRepositoryReleaseDownloadStrategy
        sha256 "706fe44f28e4692fa544583ff9898b8bdf4b4851ad13b4283ac1a4d131022cc4"

        def install
          bin.install "eta"
        end
      end
    end
  end
end
