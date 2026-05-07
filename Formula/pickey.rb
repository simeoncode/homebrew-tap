class Pickey < Formula
  desc "Automatic SSH key selection for git"
  homepage "https://github.com/simeoncode/pickey"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-aarch64-apple-darwin"
      sha256 "f63dc0eefff9e3f16a701285a72a61b57ee114337b2d440bc6692e27d725d0bd"
    else
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-x86_64-apple-darwin"
      sha256 "149073c747de15baaca909d4acb59f56e183130c844f5bc019243aae3c651e7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-aarch64-unknown-linux-musl"
      sha256 "3de0510895bab5f1caf949b00d29b97b76106865964cd53b09624a280d7c552d"
    else
      url "https://github.com/simeoncode/pickey/releases/download/v#{version}/pickey-x86_64-unknown-linux-musl"
      sha256 "20d929bbf49f41554b10d5376fa6b6ef76fa2a02b8c4cafa8469850bf1f8fee0"
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
