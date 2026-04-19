class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v2.0.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.0.0/telepath-darwin-arm64.tar.gz"
      sha256 "df957ea4c52855786893a411ebf4c585f743b968a8cb39696e5950bdadeaf9e1"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.0.0/telepath-darwin-amd64.tar.gz"
      sha256 "ebcac257373efb066bcd66fcb30f944438eec7da5d11e3342ffdb0817210aed9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v2.0.0/telepath-linux-arm.tar.gz"
        sha256 "02d628176c858028bcdffa0f5e22f34c2816459cd7b5cb41162ec139e18cfc5e"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v2.0.0/telepath-linux-arm64.tar.gz"
        sha256 "052fb77cc0bf274f1fd3e7e2b0f3d2812b7b8f95287f8ab678a32a56f4ef3c4f"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v2.0.0/telepath-linux-amd64.tar.gz"
      sha256 "e9ee34e3942e0af374f7ddce4d0c49186d18ec7b7ea57608b98c754d06df589c"
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
