class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.5.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.5.0/eyez-darwin-arm64.tar.gz"
      sha256 "2c217e5198374841bc198f62b8828e50dd82ca5d112f0ce3c0dce5056a482d48"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.5.0/eyez-darwin-amd64.tar.gz"
      sha256 "a74b3784cfe8aaf30a625953f8721b5898a3b94d429ca4b5ceae10e35e204c41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.5.0/eyez-linux-arm.tar.gz"
        sha256 "b00c70754564593f1c4ea6e12e36eb98cdec1d2c0c7af6785c232d562479f70c"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.5.0/eyez-linux-arm64.tar.gz"
        sha256 "5a70eb781ac07c3d1dc77b1d61a69cfafd5402794496b3196029f502d4a5c2a6"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.5.0/eyez-linux-amd64.tar.gz"
      sha256 "c94ae13ee4e737fa19deeaa952127e27694d22606863b0e99de7f5a5a7ab4248"
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
