class Dircmp < Formula
  desc "Terminal TUI for comparing two directories side by side"
  homepage "https://github.com/ilyasturki/dircmp"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-arm64"
      sha256 "66d3131645de4e37f425433154a691f8365bcdb0f08fe9db49f6023ca48fc72b"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-x64"
      sha256 "497a3a28207edd69cde1f5f0c99f62165c435dc0328c8a8f5998742b31e7f109"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-arm64"
      sha256 "dadd0c46caa1205d0bbf5cd252d7136b7b32f197798b457d99c8d7977410c8f8"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-x64"
      sha256 "1d4af7ac95a0dc745d98f760c4b6c2d7317d9d8c7d921e556975e30f9a85446a"
    end
  end

  def install
    binary = Dir.glob("*").first
    chmod 0755, binary
    bin.install binary => "dircmp"
    generate_completions_from_executable(bin/"dircmp", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dircmp --version")
  end
end
