class Pickey < Formula
  desc "Automatic SSH key selection for git"
  homepage "https://github.com/simeoncode/pickey"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-aarch64-apple-darwin"
      sha256 "1c2dacbc9cf47afb4ca8718c7f47ba5e895fab864d642eb9ab64f8549e41cbf4"
    else
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-x86_64-apple-darwin"
      sha256 "4e25461cf5f56d3e88728d7a55dac3fbb6bd443a882d717768672f37f9846f5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-aarch64-unknown-linux-musl"
      sha256 "3309a9065a9613e7be7a161f29131cf671fa51f37ea5d7cd53f14346651c17a5"
    else
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-x86_64-unknown-linux-musl"
      sha256 "a326883e9fdcf2e8709e4290d5d443bca6cd7080da10b6a40ceaf1a996b0405f"
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
