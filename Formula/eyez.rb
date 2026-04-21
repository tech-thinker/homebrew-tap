class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.1.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.1.0/eyez-darwin-arm64.tar.gz"
      sha256 "606e3f44e81c9a8dd715119f0883a017b1dfa098991f9fff4868c7a7e80a8928"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.1.0/eyez-darwin-amd64.tar.gz"
      sha256 "425aaf57786bec003c8e223f00a0d1a4534e7c13271e5721156e5a447d01c2db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.1.0/eyez-linux-arm.tar.gz"
        sha256 "2f89db946e4477b6cf68c51856b583bdf3018865d0c39a98925072e81145810b"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.1.0/eyez-linux-arm64.tar.gz"
        sha256 "b0effc3d5e7aa7430d666f944ea31d74c2103f8325cebd73121d5d7542ced649"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.1.0/eyez-linux-amd64.tar.gz"
      sha256 "1a84bf5142374861263014cfb0a12bba30b0173cb8ea992d11587b90c59c6887"
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
