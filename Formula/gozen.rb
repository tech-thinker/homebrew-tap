class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.4/gozen-darwin-arm64.tar.gz"
      sha256 "02d0c040ffebc5d20a195623e5dae99886970c8e82f3b00d0042d7fd2094d8a2"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.4/gozen-darwin-amd64.tar.gz"
      sha256 "61a193302ec06914dd9e6f5ef49b1cb4c0114f1ef4d356abcd18cf01065c127b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.4/gozen-linux-arm.tar.gz"
        sha256 "0604f9031f6465743f935ddf35731fe428f543755d780f47f5ced1e2fb382272"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.4/gozen-linux-arm64.tar.gz"
        sha256 "cad0e2bb79678c1ae645eb4ea25871a500b3a584506bf0d70ec245d5c89d2c6f"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.4/gozen-linux-amd64.tar.gz"
      sha256 "45ea31438c9439e8c1230a79e85c982d2f655d83875f87f17dc9038f4cc27f81"
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
