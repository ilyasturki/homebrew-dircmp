class Dircmp < Formula
  desc "Terminal TUI for comparing two directories side by side"
  homepage "https://github.com/ilyasturki/dircmp"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-arm64"
      sha256 "2ba88e7bc69a809e38ebffe89e678421d22ed4038ef852a8723d7d58bae19bb4"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-x64"
      sha256 "ea8896a2361e30fd6f2ae4bcae3b5bc405b9cca4b74e99f6648494248d7af9bb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-arm64"
      sha256 "5ee5787a18b44babdd7c5df3154474ae54dda961ac7b2640a52b7d43f2f2fad2"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-x64"
      sha256 "d52d8467c69383daf17bbf97dfb1b58eb19389c1ebc25d70605df5e2b828c895"
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
