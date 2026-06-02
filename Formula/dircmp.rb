class Dircmp < Formula
  desc "Terminal TUI for comparing two directories side by side"
  homepage "https://github.com/ilyasturki/dircmp"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-arm64"
      sha256 "4d288230d198bf38a657049408e2d8f792bdf34953445354e51e93dba2f09083"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-x64"
      sha256 "56f6918d64f96a24dcf317926777226b20fa4abe0c31aeac7746d450e85d2411"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-arm64"
      sha256 "dcfe611bcc7d7498c3a53c78a00040729dbf29f2c3660e650bfee3a920ecb85e"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-x64"
      sha256 "4819cb7d07ab16dc6dfb79551e514627046dfa72dc28c9344b17dd86cbec9220"
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
