class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.2.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.2.0/eyez-darwin-arm64.tar.gz"
      sha256 "09109d6bc6bf81c8ca3bf742ac37a982793f65eda3c1bc5d00d7ed36395aa7ef"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.2.0/eyez-darwin-amd64.tar.gz"
      sha256 "624e94ca0ddede81a344d0469cf79f76c0e09ac16d783117977dc83e766a43c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.2.0/eyez-linux-arm.tar.gz"
        sha256 "f74499240c70dc6413232f3dcfee99dcc52f568dc4120e54ae138ac0024a0dd9"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.2.0/eyez-linux-arm64.tar.gz"
        sha256 "fc457d26b01bfe7b7c1c0d2c2a43557d8a61be90c5bfd07e433430f61f85fcd7"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.2.0/eyez-linux-amd64.tar.gz"
      sha256 "33afe5eb871c13007c07c8b3fc7f2d0a31922f4197de67e75933011aa629d8ba"
    end
  end

  def install
    bin.install "build/eyez"
    man1.install "man/eyez.1"
  end

  test do
    output = shell_output("#{bin}/eyez --version")
    refute_empty output.strip
  end
end
