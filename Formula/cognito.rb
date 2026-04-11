class Cognito < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for anonymizing and restoring project-specific paths and words"
  homepage "https://github.com/romus/cognito"
  url "https://github.com/romus/cognito/releases/download/v0.3.0/cognito-0.3.0.tar.gz"
  sha256 "c2414e60df41536febbecd570bc3b9f672cc93e161d35d8f9ef9010873413ff6"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/cognito --version")
    config = testpath/"config.json"
    system bin/"cognito", "init-config", "--config", config
    assert_predicate config, :exist?
  end
end
