class Chatz < Formula
  desc "chatz is a versatile messaging app designed to send notifications to Google Chat, Slack, Discord, Telegram, SMTP and Redis."
  homepage "https://github.com/tech-thinker/chatz"
  version "v1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.0/chatz-darwin-arm64.tar.gz"
      sha256 "d3bc0cf0a6c1da58cd9d617abe1f9ff69ea5cb57d5091f23ed09411fa6c4cbef"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.0/chatz-darwin-amd64.tar.gz"
      sha256 "ec5705f0876716da7a9112384140bd9f334e3bd8d0696b857ccfb8a3e89270a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.0/chatz-linux-arm.tar.gz"
        sha256 "09933dd6ff037c6ac55b17c8b021e88bb708368612a31b63df606b8bbcbb395d"
      else
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.0/chatz-linux-arm64.tar.gz"
        sha256 "beea030ccb13105cdc90ad3f2faa24375989320b16649489ab3724c9d4594302"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.0/chatz-linux-amd64.tar.gz"
      sha256 "8b32f94301dac186454f1b95313071d0cf05191fbaa5d48131f968df082c6299"
    end
  end

  def install
    bin.install "build/chatz"
    man1.install "man/chatz.1"
  end

  test do
    assert_match "chatz", shell_output("#{bin}/chatz --version")
  end
end
