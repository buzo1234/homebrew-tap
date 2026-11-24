class Knockdrop < Formula
  desc "Share files between Macs by knocking the same rhythm"
  homepage "https://github.com/buzo1234/knockdrop"
  url "https://github.com/buzo1234/knockdrop/releases/download/v0.1.6/knockdrop-0.1.6.tar.gz"
  sha256 "e40d2269cd915422359de0f72fe46b064dc21c97a5f5dc0d219de476872b0e26"
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

      Share with Ctrl+Option+C and receive with Ctrl+Option+K from the menu bar app:
        knockdrop menubar
      It updates itself after . Upgrading from 0.1.5 or older: run it once more.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knockdrop --version")
  end
end
