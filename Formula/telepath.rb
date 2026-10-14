class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v2.1.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.2/telepath-darwin-arm64.tar.gz"
      sha256 "cedf310fb8164b89c7cbf0cc70656c895897e6ef1ff9f54ca81b9c60b1afd235"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.2/telepath-darwin-amd64.tar.gz"
      sha256 "aae7077d6440e8474479f23e45e603f6eb02ff7ebf23f8701ee9d436eb12399d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v2.1.2/telepath-linux-arm.tar.gz"
        sha256 "46e1771cf5ab36876a323fa609f19e651461ad48264623634abdc58a1c821d4f"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v2.1.2/telepath-linux-arm64.tar.gz"
        sha256 "6eb0870336ca96369c4ddb8c6b30aad25ae4b18b1b9797dcf3a25d08055cd3fb"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.1.2/telepath-linux-amd64.tar.gz"
      sha256 "3ad66779672df5625c2b1431eea60d161442cfb31bfbaf8470061b9ccc099d03"
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
