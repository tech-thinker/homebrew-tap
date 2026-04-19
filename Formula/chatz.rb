class Chatz < Formula
  desc "chatz is a versatile messaging app designed to send notifications to Google Chat, Slack, Discord, Telegram, SMTP and Redis."
  homepage "https://github.com/tech-thinker/chatz"
  version "v1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-darwin-arm64.tar.gz"
      sha256 "ba32358fd6fea6578c3359bfe7408577d7db075f649778b4fb9a679c2a4aa2d1"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-darwin-amd64.tar.gz"
      sha256 "547f1b1ecfa16200c61050765f55f4690ac2a1389528c11a12d22b98e301d844"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-linux-arm.tar.gz"
        sha256 "0c9680a4da0f003675a9eea51504244774c0f72ffbc973dbaa6d303b7062b437"
      else
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-linux-arm64.tar.gz"
        sha256 "1fa756c78cb1dbaec0d32e00ce753dfd7fbba369e0c8103ba1ba19eebdebacbc"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-linux-amd64.tar.gz"
      sha256 "a18ca02b8fbd2fbe3353f66b9a990603dd05da99ed9ed628a1118e35dfb9b3b6"
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
