class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-darwin-arm64.tar.gz"
      sha256 "49ac54c15b36f5f11ef1bdb5c54069a4caab6f642c758d9e2502e3c3847b4096"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-darwin-amd64.tar.gz"
      sha256 "545904ff31dc9914da619e2dfd20609920991d9cf9bf0c10a74a720fa56cd3ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-linux-arm.tar.gz"
        sha256 "69c99f79d581488dc1d8d5d430776b0b523228c8a66e4acb65d2d26b8dfaf49d"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-linux-arm64.tar.gz"
        sha256 "d98a1a9bf0ce419614c8317bfde5f590f158fffd5d9ff6426f2fdf91e15d5455"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-linux-amd64.tar.gz"
      sha256 "3c5a278c87cc8bb0178ca78bcb8fbe38a8b8093d33f6e7e9424d6201f0e1a8b3"
    end
  end

  def install
    bin.install "build/telepath"
    man1.install "man/telepath.1"
  end

  test do
    assert_match "telepath", shell_output("#{bin}/telepath --version")
  end
end
