class Runa < Formula
  desc "Fast and lightweight terminal file manager written in Rust"
  homepage "https://github.com/runa-fm/runa"
  version "0.15.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "df612d8ed7e0800e5bf39d9145c791f2ca80642790a74c2313ad056083b83351"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "6aa4bfffa2e27d69aee951f6af57e6cb5e55096206cfb2f13734e0a1ae429d0d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "d494aa0c98dcf47da4d7e2afa4f37825faf9fb62fd8d2a76f22f04706e55fdc4"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "5900a2ffcace843cc8eb906af5e87629dcbfc367c26b628bbdccf7349ccf5163"
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
