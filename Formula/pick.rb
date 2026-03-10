class Pick < Formula
  desc "Extract, filter, and transform values from JSON, YAML, TOML, .env, headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2805576dc84f2d366bf86695c5ecaa88958373bc5ca22afe7ca02248dca315ce"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "48ab7e2d1f61007e1f314dd6a462c6421d4430f3dfba224045ded5c6afa4e87c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "797a33f0885b7b11319090b20403223cecbd307d22936a4548204973e23c0d33"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7eeaaa90f135709551cf9e60505d6acf9c20f02e15ba968a87c995bbdf3c68c7"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
