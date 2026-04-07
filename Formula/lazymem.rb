class Lazymem < Formula
  desc "Terminal UI memory monitor for macOS dev environments"
  homepage "https://github.com/JayFarei/lazymem"
  url "https://github.com/JayFarei/lazymem/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "365f663f90f47e6c03814e72dea88090e72fef638ddd411fb61d84fa0921be8d"
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
