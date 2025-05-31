class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.7/gozen-darwin-arm64.tar.gz"
      sha256 "0e5d1eb222087a969795fefc042afe05e26702cab86552da3fa1f59b5118de3e"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.7/gozen-darwin-amd64.tar.gz"
      sha256 "b64c6f6c92736d3fc55c7a9c5c1e1f374d0ce03b1fce4bc709014d3116a7b9ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.7/gozen-linux-arm.tar.gz"
        sha256 "eb79864a130234178aeaa0b0923b1acc182b76a2a0361f14b7f6bc8a3e3226a7"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.7/gozen-linux-arm64.tar.gz"
        sha256 "56a96eef6960d97dd8a3c581ee682550cbccf397730048c445049c89dad48073"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.7/gozen-linux-amd64.tar.gz"
      sha256 "cb35be68f0aa2660b3762904a7ba0ecb8fd2a44455682cdce37f136ad9876a71"
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
