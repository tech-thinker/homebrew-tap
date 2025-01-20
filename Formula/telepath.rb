class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "GPL-3.0-only"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-darwin-arm64.tar.gz"
      sha256 "8d17a55fdf55916d57327a3da4fbff138d7149b14e3e4d5a06b0043537d1af34"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-darwin-amd64.tar.gz"
      sha256 "461da42d3b510935b691e42a9e72b44f32b743754a7eeae2ce197638901acad2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-linux-arm.tar.gz"
        sha256 "f6926a1a22981d98c3836fb43ef62fac277801d48d534211001b63e13d4312fe"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-linux-arm64.tar.gz"
        sha256 "3c7ed4165352385748b71ed14609da07b2379108df75462da800843ee9917652"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.0/telepath-linux-amd64.tar.gz"
      sha256 "62166b5660de8c2440c471454e239dc9132afdd549654113a6363228d07c8ed8"
    end
  end

  def install
    bin.install "build/telepath"
    man1.install "man/telepath.1"
  end

  test do
    assert_match "telepath", shell_output("#{bin}/telepath --version")
  end
end
