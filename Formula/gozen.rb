class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.6/gozen-darwin-arm64.tar.gz"
      sha256 "7c0708d373eaf525b96be73a18127052fdc0fbb47271d00a307f07c75d6ce41d"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.6/gozen-darwin-amd64.tar.gz"
      sha256 "7af141881cc8b73c0c5b0e0d6b08494655adc6c9ec2829bae88517a9b4897b6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.6/gozen-linux-arm.tar.gz"
        sha256 "f28babf698d83a6888e585a8663407f6eabbb1a14c4918f78ba8ec1996ad8f99"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.6/gozen-linux-arm64.tar.gz"
        sha256 "914c822e8bc860ea7602c372669563ca33d9366ebfa7114e04558a502b3e8bc2"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.6/gozen-linux-amd64.tar.gz"
      sha256 "ca27db189927c113a7accff7b911a1040e13b298411fbe2820ee9e8c4f5c97cd"
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
