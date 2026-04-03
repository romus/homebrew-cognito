class Cognito < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for anonymizing and restoring project-specific paths and words"
  homepage "https://github.com/romus/cognito"
  url "https://github.com/romus/cognito/releases/download/v0.1.1/cognito-0.1.1.tar.gz"
  sha256 "957efd0f3606ad2ca5f584a11259ad7d7dcb20cfc807c4a50c7abffdfaa70ff6"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/cognito --version")
    config = testpath/"config.json"
    system bin/"cognito", "init-config", "--config", config
    assert_predicate config, :exist?
  end
end
