class Clawrtc < Formula
  include Language::Python::Virtualenv

  desc "Mine RTC tokens with your AI agent - Proof of Antiquity consensus"
  homepage "https://bottube.ai"
  url "https://files.pythonhosted.org/packages/source/c/clawrtc/clawrtc-1.6.0.tar.gz"
  sha256 "2c94df74f1647d5f3a245a288936687cba41e770da392808c2eff36e653d5d24"
  license "MIT"

  depends_on "python@3"

  resource "requests" do
    url "https://files.pythonhosted.org/packages/source/r/requests/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7f0edf3fcb0fce8b0511f7a990d33c1f6"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      ClawRTC mines RustChain tokens using Proof of Antiquity consensus.

      Hardware multipliers:
        Apple Silicon (M1/M2/M3): 1.2x
        Modern x86:               1.0x
        VMs:                      ~0x (detected and penalized)

      Quick start:
        clawrtc install --wallet my-agent
        clawrtc start

      More info: https://bottube.ai
    EOS
  end

  test do
    assert_match "ClawRTC", shell_output("#{bin}/clawrtc --help 2>&1", 2)
  end
end
