class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v1.0.1/gozen-darwin-arm64.tar.gz"
      sha256 "25e501a767e665a02ff03c9599eaa4f709497d1095531b0f5a095e39bbcfb00b"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v1.0.1/gozen-darwin-amd64.tar.gz"
      sha256 "1b73cb98d27b62993750b2904eded3767613ff4318a7a4267bb2b3e7b5a32944"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v1.0.1/gozen-linux-arm.tar.gz"
        sha256 "2c7d5ef62c4688ecb581306a0ddb2724973689f7fc9b0d1c8ca2f5c23ac48cdd"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v1.0.1/gozen-linux-arm64.tar.gz"
        sha256 "04d23133e95d0bed3dc11d04abd4329acd81d5f6af9e2f161714183b08dbd0e1"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v1.0.1/gozen-linux-amd64.tar.gz"
      sha256 "6f50425797f744db3d38386358142a0f2b397250edfdcd00278edbfbdaaf043c"
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
