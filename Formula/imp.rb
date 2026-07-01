class Imp < Formula
  desc "TypeScript/JavaScript runtime — one binary, no node_modules"
  homepage "https://github.com/snatvb/imp"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/snatvb/imp/releases/download/v0.1.0/imp-v0.1.0-mac-arm64.tar.gz"
      sha256 "583c9b4a8ce9403fa58fe4433ff2e6a26548b4d8ac7608b8fdb9581d90dbfa57"
    else
      on_intel do
        url "https://github.com/snatvb/imp/releases/download/v0.1.0/imp-v0.1.0-linux-x64.tar.gz"
        sha256 "4737e7e5b73e2611f56038592b892028650f38aa734f255715255949363639bf"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/snatvb/imp/releases/download/v0.1.0/imp-v0.1.0-linux-arm64.tar.gz"
      sha256 "fc9acfe4ae2596558c1517944898cfa14942cb08958eabd0af688670023bdef5"
    else
      url "https://github.com/snatvb/imp/releases/download/v0.1.0/imp-v0.1.0-linux-x64.tar.gz"
      sha256 "c9476630183fe277980cb571a0f856d94bc714428db40178bd9a7a656e40d44b"
    end
  end

  def install
    bin.install "imp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imp --version")
  end
end
