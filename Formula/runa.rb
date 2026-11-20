class Runa < Formula
  desc "Fast and lightweight terminal file manager written in Rust"
  homepage "https://github.com/runa-fm/runa"
  version "0.15.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "fc5ef55569235c94e60942769858ac6547212530325a4f407c643126364b6bc5"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "f1af975e7760a71d9ee05cc5d02c1df1ad115582e62c57be13d721a3cf0469f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "2781d81c681f7e2d1971aae9a0363c033fcedcbe9f2a8a95edc2ebb76c2044f3"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "60c8f98003324fe0932c6e34f1c7c631fe3b1b2e3dfd13f219fa03f27573e94e"
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
