class Pickey < Formula
  desc "Automatic SSH key selection for git"
  homepage "https://github.com/simeoncode/pickey"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-aarch64-apple-darwin"
      sha256 "126eecd072c3ddfcca2a1524332fdab9bceb500ae0df6f91a9b4eb25b97085ae"
    else
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-x86_64-apple-darwin"
      sha256 "f9092c3eac322a188ffa93ad164ecf65cc941a3f9359a3c5de798da36daea7d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-aarch64-unknown-linux-musl"
      sha256 "3eab975ac827796ab58b51443e88e46e36c3f4011b82c668456a2163a265228a"
    else
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-x86_64-unknown-linux-musl"
      sha256 "8cde870f37168c2b9ee16e38d105f63769f1968ebf40c2aa486d6b57f4c7556d"
    end
  end

  def install
    binary = Dir["pickey-*"].first
    chmod 0755, binary
    bin.install binary => "pickey"
  end

  test do
    assert_match "Automatic SSH key selection for git", shell_output("#{bin}/pickey --help")
  end
end
