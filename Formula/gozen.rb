class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.2/gozen-darwin-arm64.tar.gz"
      sha256 "d621a5f6a1075be282eb86e1e585833a1b13d6e62fb03beb6c5ee9289672532a"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.2/gozen-darwin-amd64.tar.gz"
      sha256 "4ab29ca47eb895b73061fa91b364e3db4b76d3815e23b75cf939d67641d565cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.2/gozen-linux-arm.tar.gz"
        sha256 "21a117ae69d701ecdc671609e585fd092b7d3526487e33adc83f188a552a0d53"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.2/gozen-linux-arm64.tar.gz"
        sha256 "3640f612745bfd42dc57c6727b29d036467a50adfdacb8121595dc3468e72bba"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.2/gozen-linux-amd64.tar.gz"
      sha256 "76106e3fe5539a564e49cb42ab26d8de1c8a8c49053c094ed0885479b4e98915"
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
