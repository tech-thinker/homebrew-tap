class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.3/gozen-darwin-arm64.tar.gz"
      sha256 "d7f7cc8c13404cdb0c17fbb8c598daa97155f99130195e4bfb9b0b4fe96b8195"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.3/gozen-darwin-amd64.tar.gz"
      sha256 "a475233a2560919fff26643f1cf77f27f1d1621dc2f0a85faab53063659edc6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.3/gozen-linux-arm.tar.gz"
        sha256 "7f1b04789c5401dd6fc8b826e0cdf16f4847522bb6f0e70e8389bbed9b3af59e"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.3/gozen-linux-arm64.tar.gz"
        sha256 "6ba29dcc64172b83297f87791c309c0e3e2ffb533d0521ee424f7356afb23cc2"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.3/gozen-linux-amd64.tar.gz"
      sha256 "dc266d743a9871203445a77a128b9829ac2da0512d23f2dad0214c6bcfbeccbf"
    end
  end

  def install
    bin.install "build/gozen"
    man1.install "man/gozen.1"
  end

  test do
    assert_match "gozen", shell_output("#{bin}/gozen --version")
  end
end
