class Dircmp < Formula
  desc "Terminal TUI for comparing two directories side by side"
  homepage "https://github.com/ilyasturki/dircmp"
  version "1.0.3"
  license "MIT"
  bottle :unneeded

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-arm64"
      sha256 "0623abea7f610b3eef722b4d4be9efa6a6023cd0ea3cff0f61cce23f00862ab1"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-x64"
      sha256 "ba25a4771c5ddfadfa5c40b89c430328f3333fd612495ab4674e43b812d97c3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-arm64"
      sha256 "3da6118183fcdc986a928125e03c9f7651e13ce858e2b3ce2543d9473951e7cb"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-x64"
      sha256 "52a9054ce637a27fdf12a89742152ceb53103dc1d47efac36177013223e3c6af"
    end
  end

  def install
    bin.install Dir.glob("*").first => "dircmp"
    generate_completions_from_executable(bin/"dircmp", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dircmp --version")
  end
end
