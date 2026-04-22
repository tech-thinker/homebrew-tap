class Eyez < Formula
  desc "eyez - is the powerful CLI tool for viewing image in the terminal (Mostly any terminal)."
  homepage "https://github.com/tech-thinker/eyez"
  version "v1.3.0"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.3.0/eyez-darwin-arm64.tar.gz"
      sha256 "768f32f4e24418c820f910e6d849e2b2f440b96539a5cd4a24e23582ea1bb822"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.3.0/eyez-darwin-amd64.tar.gz"
      sha256 "c21a3ee086546e6dafdf613baa5c740e272bc7f2ddea0f71967d13a6c9151775"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/eyez/releases/download/v1.3.0/eyez-linux-arm.tar.gz"
        sha256 "72e7ff003f1d4159750463634d373cb2a3e695ae69307705eec047cf42e209b6"
      else
        url "https://github.com/tech-thinker/eyez/releases/download/v1.3.0/eyez-linux-arm64.tar.gz"
        sha256 "86f331531a4fb21bbde168c96b341d9d0923d522cfe37f0cb727e74332a65a47"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/eyez/releases/download/v1.3.0/eyez-linux-amd64.tar.gz"
      sha256 "92d0e3de3709a33e00e170fd1f4a49e266c77862be7676b9113b9f86d81b42db"
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
