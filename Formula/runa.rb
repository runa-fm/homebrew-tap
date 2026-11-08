class Runa < Formula
  desc "Fast and lightweight terminal file manager written in Rust"
  homepage "https://github.com/runa-fm/runa"
  version "0.15.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-aarch64.tar.gz"
      sha256 "19bd73e9600496eec9f4b97a9e05053cb64a150b7306b3f85ed63694ff0a7c9a"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-macos-x86_64.tar.gz"
      sha256 "d2bfbc22307a9214535efefdb22ef121f3a64106a02b8eeb016348c5a880c388"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-aarch64-gnu.tar.gz"
      sha256 "7b6701721a91b8b366d8d9fc8c9108d61d89a307dadf67bab7d64583ffd715b4"
    else
      url "https://github.com/runa-fm/runa/releases/download/v#{version}/runa-linux-x86_64-gnu.tar.gz"
      sha256 "a99d2207773fdbf782d39440720587877987bc3557213512b9122c07493ea88c"
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
