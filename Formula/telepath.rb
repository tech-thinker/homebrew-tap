class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v1.0.1"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-darwin-arm64.tar.gz"
      sha256 "7aaea816ab91b193b3703f8e470a03164deb1a4cc50a126aa8fad23a43551047"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-darwin-amd64.tar.gz"
      sha256 "f6a0984c4a3e52948cca18ab0be9e74cefe2b45c6855344df1a17341b5ed8129"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-linux-arm.tar.gz"
        sha256 "0110f41ea2f68c083dcf8e5ae85cca84fe52861eba7a5a0e0405260378522f89"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-linux-arm64.tar.gz"
        sha256 "45a2d36b960c534f549742d7454de6010facc1fc99e2de350d4cfdaea9aef8d0"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.1/telepath-linux-amd64.tar.gz"
      sha256 "e86019f3b567bd026375e54f06fc82cbdeb0a7f600f1f0f3693c2656bc216557"
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
