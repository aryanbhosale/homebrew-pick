class Pick < Formula
  desc "Extract values from anything — JSON, YAML, TOML, .env, HTTP headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fc80eefd54cdab88abda7c7a50744d8c1de47f11451151b9d19f0136b739c513"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c622b30a40ccf4913bf661f7f8c3423c7a48ab422c6d5600a916e522385688a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b45d9d99c3c3685eae83ee6a2299207d8bff3cba0d617e64605fc22ec772d514"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3553bc2344d5f97a013a4c4e6d661c5fc9270826e082e135bdfb38b26737b1db"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
