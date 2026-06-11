class Opentraces < Formula
  include Language::Python::Virtualenv

  desc "Crowdsource agent traces to HuggingFace Hub"
  homepage "https://opentraces.ai"
  url "https://github.com/JayFarei/opentraces/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "854b12d23ba81047da57197638566120497bed25ed3bbcac6f1c1f729f53fb76"
  license "MIT"
  head "https://github.com/JayFarei/opentraces.git", branch: "main"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # venv.pip_install runs with --no-deps (expects vendored resources);
    # this tap resolves dependencies from PyPI instead, so call pip directly.
    system libexec/"bin/pip", "install", "--no-input", buildpath/"packages/opentraces-schema"
    system libexec/"bin/pip", "install", "--no-input", buildpath.to_s
    bin.install_symlink libexec/"bin/opentraces"
    bin.install_symlink libexec/"bin/ot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opentraces --version")
    assert_match version.to_s, shell_output("#{bin}/ot --version")
  end
end
