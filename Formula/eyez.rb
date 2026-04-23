class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.4.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.4.0/eyez-darwin-arm64.tar.gz"
      sha256 "da1e9f728dd3afcbc9a3b4e06074e973f827762d4646e3de884508dabfac8db6"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.4.0/eyez-darwin-amd64.tar.gz"
      sha256 "42e387d74b2a0e098e200b663729eb7e2d26974375e9641b24c849f402d5abc3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.4.0/eyez-linux-arm.tar.gz"
        sha256 "093a42edea12317aaefe8e434fe380368b8ebd600a2a938ed1cff44d5155bc8f"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.4.0/eyez-linux-arm64.tar.gz"
        sha256 "9b84afc45e9431ef4c0fbe63dca81b2c7308a35f70826adb00e9a8ce7a876a89"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.4.0/eyez-linux-amd64.tar.gz"
      sha256 "54e287ffbfa504cb1b302a048ff58f0a0f7b76eae30c12b594addc7bb067dad3"
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
