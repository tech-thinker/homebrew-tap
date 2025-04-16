class Telepath < Formula
  desc "telepath is a powerful CLI tool for secure port forwarding with support for multiple jump hosts and flexible authentication."
  homepage "https://github.com/tech-thinker/telepath"
  version "v1.0.2"
  license "GPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.2/telepath-darwin-arm64.tar.gz"
      sha256 "ac640c7bf8d1ebdf25cd1d38b042871267efb008a773b54298d6ebbdeec8da54"
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.2/telepath-darwin-amd64.tar.gz"
      sha256 "62057d130195b04036908805ec67a49aa8ebdddde4b04d5c8e4e8585e234ba9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      if Hardware::CPU.is_32_bit?
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.2/telepath-linux-arm.tar.gz"
        sha256 "247e6ddfe618e9638b50ff7cc90bef89277ab376bf37091f8069142fd1c7e0ac"
      else
        url "https://github.com/tech-thinker/telepath/releases/download/v1.0.2/telepath-linux-arm64.tar.gz"
        sha256 "4414994323187137a1d2089c0a169d3c3eb9bf90a53312a67159b64f78978fe9"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/tech-thinker/telepath/releases/download/v1.0.2/telepath-linux-amd64.tar.gz"
      sha256 "b46f0db7427ebef167d7f70f0463db88561398a43a8ef70dbfcd09456f59215e"
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
