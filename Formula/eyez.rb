class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.0.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.0.0/eyez-darwin-arm64.tar.gz"
      sha256 "14f53db91f5b411cfe530aa2070ceedf841436ba5c69bd63fe05d1ed2c252312"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.0.0/eyez-darwin-amd64.tar.gz"
      sha256 "ebcac257373efb066bcd66fcb30f944438eec7da5d11e3342ffdb0817210aed9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.0.0/eyez-linux-arm.tar.gz"
        sha256 "c7ee66fb4d9aefde0916deb3a0172bf887947d52c1c73874110a736872f1af31"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.0.0/eyez-linux-arm64.tar.gz"
        sha256 "8b0ba94d3258fa6279b615b59469e6047934ca749d31dad61836d549e55ea310"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.0.0/eyez-linux-amd64.tar.gz"
      sha256 "c45af32ce02cec584434cbad0579b334f24aaf94f594a9ad67659d75a359f4e8"
    end
  end

  def install
    bin.install "build/eyez"
    man1.install "man/eyez.1"
  end

  test do
    # output = shell_output("#{bin}/eyez --version")
    # refute_empty output.strip
  end
end
