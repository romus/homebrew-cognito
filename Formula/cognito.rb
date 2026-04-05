class Cognito < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for anonymizing and restoring project-specific paths and words"
  homepage "https://github.com/romus/cognito"
  url "https://github.com/romus/cognito/releases/download/v0.2.0/cognito-0.2.0.tar.gz"
  sha256 "5de80066ad55d3c882230944f053149db655b753f4b098e43520726d7e6aed99"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/cognito --version")
    config = testpath/"config.json"
    system bin/"cognito", "init-config", "--config", config
    assert_predicate config, :exist?
  end
end
