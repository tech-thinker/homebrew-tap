class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v1.0.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-darwin-arm64.tar.gz"
      sha256 "818c7f237f961b0eb935640e471e2ba420a1cece0ad325d57003643d3ecb2844"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-darwin-amd64.tar.gz"
      sha256 "5ef336697a43a11375e882f85e0bd86e3585019289683af3feb9472c2bb8e2aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-linux-arm.tar.gz"
        sha256 "4249fde2a685329591ec9e9e529b1e9151478c1f02ea333500dc3583544e2c92"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-linux-arm64.tar.gz"
        sha256 "fdc718f66753e28aa7981254a8c7b1900f453aefd7b5584ebc88c3f74ba37d37"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-linux-amd64.tar.gz"
      sha256 "06d38563f8a309c4950a357aae92a768565b39d937306e1c8448c4f095bb97f4"
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
