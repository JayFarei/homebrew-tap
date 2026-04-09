class Lazymem < Formula
  desc "Terminal UI memory monitor for macOS dev environments"
  homepage "https://github.com/JayFarei/lazymem"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/JayFarei/lazymem/releases/download/v0.2.1/lazymem-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "e5bfdabe10a2f8e4b4970603d100024e1d1cf1814fee00487249445e3c87739f"
    else
      url "https://github.com/JayFarei/lazymem/releases/download/v0.2.1/lazymem-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "8f673703dfc4d8035c7e606e6150075229688503d2229e4bb9bebba68b0bced4"
    end
  end

  def install
    bin.install "bin/lazymem"
    pkgshare.install "README.md", "LICENSE"
    pkgshare.install "skill"
  end

  test do
    assert_match "lazymem v#{version}", shell_output("#{bin}/lazymem --version")
  end
end
