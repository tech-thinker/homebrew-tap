class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-darwin-arm64.tar.gz"
      sha256 "4ae79c4ca941a7f1dc1a294f155f3d1fac391c8a302d4fc1011974bd0b3fe940"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-darwin-amd64.tar.gz"
      sha256 "e2f7bc47051b0bcd8c4904590a3e660fe08ae3837f577ca3348116365fb6fb3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-linux-arm.tar.gz"
        sha256 "32247d76b40543e9fc13a6e251a08ef8dbaefa7153aa02fb6f644bf9b1d692a5"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-linux-arm64.tar.gz"
        sha256 "4ae79c4ca941a7f1dc1a294f155f3d1fac391c8a302d4fc1011974bd0b3fe940"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-linux-amd64.tar.gz"
      sha256 "e2f7bc47051b0bcd8c4904590a3e660fe08ae3837f577ca3348116365fb6fb3b"
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
