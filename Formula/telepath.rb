class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v2.1.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.1/telepath-darwin-arm64.tar.gz"
      sha256 "f2d2612bc8c853f79c72c8ca146dc930d02b7ac18d6c9e69cf2fa83d2f53fc23"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.1/telepath-darwin-amd64.tar.gz"
      sha256 "880b3b1adde454abd867f148b217db559eeb8c5c2d190bec782929375b0c6d96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v2.1.1/telepath-linux-arm.tar.gz"
        sha256 "a25a59c3b71c72ad6d5763ff686c40071bc253b50c01cfe033dbfb44b77dcf0d"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v2.1.1/telepath-linux-arm64.tar.gz"
        sha256 "7ff057f9678169be8742576a1f97282b9ae042313f69650bcec5723d1efda6f7"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.1/telepath-linux-amd64.tar.gz"
      sha256 "18be1a4257d5436a849ce0157253c2b6992255ae4bcee16582267aafa37c2be8"
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
