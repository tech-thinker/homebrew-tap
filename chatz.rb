class Chatz < Formula
  desc "Slack, Google Chat, Discord and Telegram bot for sending messages/notifications."
  homepage "https://github.com/tech-thinker/chatz"
  url "https://github.com/tech-thinker/chatz/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "ead73999bc30b74163b957c2135904db660f72d32754cf44ee9ed75ef95c68ff"
  license "MIT"

  depends_on "go" => :build

  def install
    # tag = version.to_s
    # commit = Utils.git_short_head
    tag = "v1.1.2"
    commit = "none"
    system "make", "build", "VERSION=#{tag}", "COMMIT=#{commit}"
    bin.install "chatz"
    man1.install "man/chatz.1"
  end

  test do
    assert_match "chatz", shell_output("#{bin}/chatz --version")
    system "false"
  end
end
