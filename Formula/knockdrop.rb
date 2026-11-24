class Knockdrop < Formula
  desc "Share files between Macs by knocking the same rhythm"
  homepage "https://github.com/buzo1234/knockdrop"
  url "https://github.com/buzo1234/knockdrop/releases/download/v0.1.4/knockdrop-0.1.4.tar.gz"
  sha256 "a2113f617fdea490dcbd9372b577b67f31a8dd67e139fa34841263739dc681a4"
  license "MIT"

  depends_on :macos

  def install
    inreplace "knockdrop.py", /^__version__ = .*$/, "__version__ = \"#{version}\""
    libexec.install "knockdrop", "knockdrop.py", "macimu", "menubar"
    bin.install_symlink libexec/"knockdrop"
  end

  def caveats
    <<~EOS
      Run `knockdrop check` once. If it reports Local Network access as BLOCKED, allow your
      terminal app in System Settings > Privacy & Security > Local Network.

      Receive without typing a command -- just knock -- with the menu bar app:
        knockdrop menubar
      After upgrading, run it again (or use "Restart to Finish Updating" in its menu).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knockdrop --version")
  end
end
