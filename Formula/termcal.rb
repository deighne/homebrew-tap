class Termcal < Formula
  include Language::Python::Virtualenv

  desc "Keyboard-driven terminal calendar built on caldir"
  homepage "https://github.com/deighne/termcal"
  url "https://github.com/deighne/termcal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8a98e7cad987e8ce95c3462a9a4d35cf4ea329e089bb0d6de65ab006adf7b83a"
  license "MIT"
  head "https://github.com/deighne/termcal.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      TermCal requires caldir (v0.14+). If you haven't installed it yet:
        curl -sSf https://caldir.org/install.sh | sh

      Verify your setup with:
        termcal --check
    EOS
  end

  test do
    assert_match "termcal #{version}", shell_output("#{bin}/termcal --version")
  end
end
