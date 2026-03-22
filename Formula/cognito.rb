class Cognito < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for anonymizing and restoring project-specific paths and words"
  homepage "https://github.com/romus/cognito"
  url "https://github.com/romus/cognito/releases/download/v0.1.0/cognito-0.1.0.tar.gz"
  sha256 "b14ab6be49ce283525149c1f4d27b0ee96833dc7edb0d5f9fc7e10bf97ab00ab"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/cognito --version")
    config = testpath/"config.json"
    system bin/"cognito", "init-config", "--config", config
    assert_predicate config, :exist?
  end
end
