class Dircmp < Formula
  desc "Terminal TUI for comparing two directories side by side"
  homepage "https://github.com/ilyasturki/dircmp"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-arm64"
      sha256 "7cb98e8af10d2a798b7cab7e479e215a2b785e0f63f2b178a7b4ffabab7d7b3e"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-darwin-x64"
      sha256 "5fefbda44e117f43e071e12f2f5bb96390b059da209cbce50e81b54ecd57f59e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-arm64"
      sha256 "4066b3e2db92a3265cf18f9dcbd3e0dae489a749fcd1429676ed70618b2e7a52"
    end
    on_intel do
      url "https://github.com/ilyasturki/dircmp/releases/download/v#{version}/dircmp-linux-x64"
      sha256 "ce9d6e3f69560d5b7bcf7cc07c4720d25a4b63ccda4dfcf85b01dbcf9bdd75b8"
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
