class Knockdrop < Formula
  desc "Share files between Macs by knocking the same rhythm"
  homepage "https://github.com/buzo1234/knockdrop"
  url "https://github.com/buzo1234/knockdrop/releases/download/v0.1.1/knockdrop-0.1.1.tar.gz"
  sha256 "216714083595731cf276a8439bcaa46f02b61c77e320d5dc3c09ba654124c3cc"
  license "MIT"

  depends_on :macos

  def install
    inreplace "knockdrop.py", /^__version__ = .*$/, "__version__ = \"#{version}\""
    libexec.install "knockdrop", "knockdrop.py", "macimu"
    bin.install_symlink libexec/"knockdrop"
  end

  def caveats
    <<~EOS
      Run `knockdrop check` once. If it reports Local Network access as BLOCKED, allow your
      terminal app in System Settings > Privacy & Security > Local Network.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knockdrop --version")
  end
end
