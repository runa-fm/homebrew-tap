class Runa < Formula
  desc "Fast and lightweight terminal file manager written in Rust"
  homepage "https://github.com/runa-fm/runa"
  version "0.15.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "074fcf9acf413364712da1b5c42ccf3615b16c66fc1b20524264721d4b2bbd49"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "24eeee3ecf869871bf551aa9e8bdac9da4b427ca00379a71d51249967d60df94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "80da17a7d4516239e6c68c3698e959867d8a98ff639437a9127c4108f064fc2c"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "455469ab310c8df01f5b7818df9c0eaa82051325048a406b290202d9ceb8bd7a"
    end
  end

  def install
    bin.install "rn"

    doc.install "LICENSE-MIT" if File.exist? "LICENSE-MIT"
    doc.install "LICENSE-APACHE" if File.exist? "LICENSE-APACHE"
    doc.install "README.md" if File.exist? "README.md"
    doc.install "docs/configuration.md" if File.exist? "docs/configuration.md"
    doc.install "docs/config-reference" if File.directory? "docs/config-reference"
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/rn --help")
    assert_match version.to_s, shell_output("#{bin}/rn --version")
  end
end
