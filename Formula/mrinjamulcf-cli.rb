# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class MrinjamulcfCli < Formula
  desc "A CLI to sync domains from local to Cloudflare."
  homepage "https://mrinjamul.github.io/mrinjamulcf-cli"
  version "1.2.0"
  license "MIT License"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mrinjamul/mrinjamulcf-cli/releases/download/v1.2.0/mrinjamulcf-cli_1.2.0_darwin_arm64.tar.gz"
      sha256 "f09b0acb1df05b3a17c483ce4f504e3ba992ce401c97e39e414557dcef91367e"

      def install
        bin.install "mrinjamulcf-cli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/mrinjamul/mrinjamulcf-cli/releases/download/v1.2.0/mrinjamulcf-cli_1.2.0_darwin_amd64.tar.gz"
      sha256 "3ed178b8ba3d483134392df50814b62634063a06cb63d19160c401571bb3fa25"

      def install
        bin.install "mrinjamulcf-cli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/mrinjamul/mrinjamulcf-cli/releases/download/v1.2.0/mrinjamulcf-cli_1.2.0_linux_amd64.tar.gz"
      sha256 "508bfd0da202b0b9a914ba462ef571c4278be99a09f7feeea106535d2e22799a"

      def install
        bin.install "mrinjamulcf-cli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mrinjamul/mrinjamulcf-cli/releases/download/v1.2.0/mrinjamulcf-cli_1.2.0_linux_arm64.tar.gz"
      sha256 "d0c11fbc5c736754b3c4abc73bc8f98cfaebdf1ec5b87ca6f376f5ffa88d3954"

      def install
        bin.install "mrinjamulcf-cli"
      end
    end
  end
end
