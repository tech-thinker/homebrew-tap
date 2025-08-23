class Chatz < Formula
  desc "chatz is a versatile messaging app designed to send notifications to Google Chat, Slack, Discord, Telegram, SMTP and Redis."
  homepage "https://github.com/tech-thinker/chatz"
  version "v1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-darwin-arm64.tar.gz"
      sha256 "412b1c90002b220cb3a931c9e82091ca82c94cd311de5339bee08408350001d7"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-darwin-amd64.tar.gz"
      sha256 "015e9c9fb1bd4a5c153482ff0f1dfc4adac47e19c5fff112f248b25f9de53c29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-linux-arm.tar.gz"
        sha256 "19d845dbe32109de57a770a8af7c08f7640c5d4aed755d6e17ea6f54435857ff"
      else
        url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-linux-arm64.tar.gz"
        sha256 "d611f4f21a4fc6f3ca28b1acb59c4879093fdbd1ff11527ae7981e3fef103c5b"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.2.3/chatz-linux-amd64.tar.gz"
      sha256 "a14a1083768b0bf8f207e3f854786af76e68f8b62cff099834fa5574b5ff1596"
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
