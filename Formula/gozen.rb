class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-darwin-arm64.tar.gz"
      sha256 "9b53587d9f60b08ba7992fd2f27702547d33096de685c98524637510c191c4ed"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-darwin-amd64.tar.gz"
      sha256 "81388b92843260f8211c8e5be582211e0d1ca131c21445440647da49aff4d0c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-linux-arm.tar.gz"
        sha256 "c4cedf9b7fdd48a4a79fc3c8d4d448baf1688a454aff36ff95a0ff26e66eff40"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-linux-arm64.tar.gz"
        sha256 "303e36122a8254ec00d44225c26fd436f140d4ccdffc967210703672261ae601"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.0/gozen-linux-amd64.tar.gz"
      sha256 "a033fd2e2054710730793ca4d62eebd44dda1c64705f27f3246a68809ae1fd5d"
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
