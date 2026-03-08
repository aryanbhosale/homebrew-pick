class Pick < Formula
  desc "Extract values from anything — JSON, YAML, TOML, .env, HTTP headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3fd104c37f4674d7b587aa29172ec973445b13fe96fa411f0206d9e473f047fa"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fbb05d7e74875b9529d6b74c96ab4bf7c5d092054a910a4c78e3659f81385aa7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "326a1859de324512ac8020fd95bda1ecb99d619d78aff911b5a32c232e449a81"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08c120bba0d7df7c494cbef8fc8c48d1655b2ee5af17fa10acfdd5a07afcec39"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
