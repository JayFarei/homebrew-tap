class Opentraces < Formula
  include Language::Python::Virtualenv

  desc "Crowdsource agent traces to HuggingFace Hub"
  homepage "https://opentraces.ai"
  url "https://github.com/JayFarei/opentraces/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "bd67f2df88d191f80bfcf6b81614e8c5abfba829ad3e2c100a7e85f6950bfe51"
  license "MIT"
  head "https://github.com/JayFarei/opentraces.git", branch: "main"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install buildpath/"packages/opentraces-schema"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opentraces --version")
    assert_match version.to_s, shell_output("#{bin}/ot --version")
  end
end
