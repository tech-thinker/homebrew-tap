class Gozen < Formula
  desc "gozen is a simplified golang MVC framework to generate projects and components."
  homepage "https://github.com/tech-thinker/gozen"
  version "v1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/gozen/releases/download/v1.0.0/gozen-darwin-arm64.tar.gz"
      sha256 "a22c6d0d48e5b7daa5b2c25cd217ca534400d4fb5ebb471f0bd9eb7ecc50b9b0"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v1.0.0/gozen-darwin-amd64.tar.gz"
      sha256 "92c37f77167a6753fba6ec4bef501a399f9a4c44bc1dc89aea7850f79bfd3b9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/gozen/releases/download/v1.0.0/gozen-linux-arm.tar.gz"
        sha256 "2619882ec7bcfdeeab65fa9d430dacfd953e5e1060df944348437cdccc662b68"
      else
        url "https://github.com/tech-thinker/gozen/releases/download/v1.0.0/gozen-linux-arm64.tar.gz"
        sha256 "cf045db9bb29dcf56770511786d8c1ec01786a266cdb78d938ba2a18f813c60a"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/gozen/releases/download/v1.0.0/gozen-linux-amd64.tar.gz"
      sha256 "8805c1398d9431b83e45be2fb4d44395ae0ab6447bdecd6e5b1f70d99305fe74"
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
