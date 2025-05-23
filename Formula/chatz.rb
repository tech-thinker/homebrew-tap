class Chatz < Formula
  desc "chatz is a versatile messaging app designed to send notifications to Google Chat, Slack, Discord, Telegram, SMTP and Redis."
  homepage "https://github.com/tech-thinker/chatz"
  version "v1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.1/chatz-darwin-arm64.tar.gz"
      sha256 "6e5a04b720eb475697842e41b203f388aafda143e783b89989d794d4309660ec"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.1/chatz-darwin-amd64.tar.gz"
      sha256 "4509d5b470f5e8e9a575a03dcb850187acca524e561ccc45388897eefe656d43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.1/chatz-linux-arm.tar.gz"
        sha256 "ccfb43aff6f3e1f2fe771617ebbcaebc58b7fd3885b041b22675dc163c0331e3"
      else
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.1/chatz-linux-arm64.tar.gz"
        sha256 "d469ffedfef306312d5dfd101b8f9e86692a0c8d7ae57f4ba0e8b0c55d9a8714"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.1/chatz-linux-amd64.tar.gz"
      sha256 "32fb70ca25b066f805c8a4c9256b9cbca11962b206dc717832ee77c78ed2cf69"
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
