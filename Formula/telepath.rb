class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v2.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.0/telepath-darwin-arm64.tar.gz"
      sha256 "02ddcc5ba77a545a704d27410f1a553420f8b7035148d85dbb00df4da67e9015"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.0/telepath-darwin-amd64.tar.gz"
      sha256 "9c6032a529f8468b9faaace99e67a3f1ec627e3227eca2ab04a194bb34441613"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v2.1.0/telepath-linux-arm.tar.gz"
        sha256 "d697063cde692138413efd6b5f506e463108aa8a2be7bfa12331e99309c5c0ff"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v2.1.0/telepath-linux-arm64.tar.gz"
        sha256 "58da6a201575b0c0ce2c599415509f117e029402a87b49aa6fb806945fa6c334"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.0/telepath-linux-amd64.tar.gz"
      sha256 "73ab70e94d63acad8c8eb939079c5c7eac72d601e07a5eb281f19b319b6bc850"
    end
  end

  def install
    bin.install "build/telepath"
    man1.install "man/telepath.1"
  end

  test do
    output = shell_output("#{bin}/telepath --version")
    refute_empty output.strip
  end
end
