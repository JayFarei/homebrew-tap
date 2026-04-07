class Lazymem < Formula
  desc "Terminal UI memory monitor for macOS dev environments"
  homepage "https://github.com/JayFarei/lazymem"
  url "https://github.com/JayFarei/lazymem/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "34ac4ba4fc9ec056535eab343723feb7e6d9f6eef8d59c10927943b91bae52f7"
  license "MIT"
  head "https://github.com/JayFarei/lazymem.git", branch: "main"

  depends_on "bun"
  depends_on :macos

  def install
    system "bun", "install", "--production"
    libexec.install Dir["*"]
    (bin/"lazymem").write_env_script libexec/"bin/lazymem", PATH: "#{Formula["bun"].opt_bin}:${PATH}"
  end

  test do
    assert_match "lazymem v#{version}", shell_output("#{bin}/lazymem --version")
  end
end
