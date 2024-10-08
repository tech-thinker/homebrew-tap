class Chatz < Formula
  desc "chatz is a versatile messaging app designed to send notifications to Google Chat, Slack, Discord, Telegram and Redis."
  homepage "https://github.com/tech-thinker/chatz"
  version "v1.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.1.3/chatz-darwin-arm64.tar.gz"
      sha256 "6fcf9731f8b83653a9aa410d5ba90da97252d8cabf85010c56daf5fbf3a22f5d"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.1.3/chatz-darwin-amd64.tar.gz"
      sha256 "01a43ca536f284ab881999e12860976c96ca2712869dc3f005e7dcb332717ccc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/chatz/releases/download/v1.1.3/chatz-linux-arm.tar.gz"
        sha256 "4837e7526a421ceb36aca4635c2e51a98fd7dd7066fe71ea94320d478d7d3154"
      else
        url "https://github.com/tech-thinker/chatz/releases/download/v1.1.3/chatz-linux-arm64.tar.gz"
        sha256 "b63807fcaa28d41d716f532ea3cc9868da92dbeb06d04a465a3036badb0c11df"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/chatz/releases/download/v1.1.3/chatz-linux-amd64.tar.gz"
      sha256 "56fc8296e43b57e6630003b1f1f5d69493f05dd62ae3c90dea5d93ffabda4336"
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
