class Dircmp < Formula
  desc "Terminal TUI for comparing two directories side by side"
  homepage "https://github.com/ilyasturki/dircmp"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-arm64"
      sha256 "f207beee08d9c5b2291a980a908ecf707bf523980f93eb0c252e74d3b0d9248e"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-x64"
      sha256 "9a369c2def5fd27ed60a42f1e39ecb765d8db5503309545c0a13a203188b3bf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-arm64"
      sha256 "ae589feaca75215b382161d2ceda435668a969124d3925ffbbc3d59618eab3c9"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-x64"
      sha256 "045e0c26a9af419a894957ba985c787042b35d55bdcca6d345e4c4d41b9d8d10"
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
