class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.1/gozen-darwin-arm64.tar.gz"
      sha256 "f846b32734cc49499a56a6f27abeb81bd39b38ac90fb538682e27c737fd76856"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.1/gozen-darwin-amd64.tar.gz"
      sha256 "f52646db656d08457563bb2870a363c151845e86556c14648d5bbc28f76be434"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.1/gozen-linux-arm.tar.gz"
        sha256 "332de8f362db617195a399e68412bd63f74910a7e5396b7c2f83fa5bf4bfc0a1"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v0.1.1/gozen-linux-arm64.tar.gz"
        sha256 "44468a244f923cb7900db2f0fb86b84048fde5979bb9602296a790420377a812"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v0.1.1/gozen-linux-amd64.tar.gz"
      sha256 "332de8f362db617195a399e68412bd63f74910a7e5396b7c2f83fa5bf4bfc0a1"
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
