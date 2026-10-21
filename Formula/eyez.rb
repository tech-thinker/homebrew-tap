class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.6.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.6.0/eyez-darwin-arm64.tar.gz"
      sha256 "f576c7416e1cc571dc5859a0edb5f27282c06aa0226075c279064b56489056dd"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.6.0/eyez-darwin-amd64.tar.gz"
      sha256 "01b7f87457b51d5c0f423d0f646d6306a1f27eacc530a80e542f1f91c20bb680"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.6.0/eyez-linux-arm.tar.gz"
        sha256 "cac17f96f3d7ed3fe5bb2d51defc5a74bea7c2d368226b856f72fe309d59926c"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.6.0/eyez-linux-arm64.tar.gz"
        sha256 "27dedd8750abeca0c67682329e7cb431e796851c5c6692175682e269d4a98590"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.6.0/eyez-linux-amd64.tar.gz"
      sha256 "0b6107c88b09c420dd405c3649573b28343daa60df03539b610e045ab6ef4f98"
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
