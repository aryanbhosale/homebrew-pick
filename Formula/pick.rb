class Pick < Formula
  desc "Extract, filter, and transform values from JSON, YAML, TOML, .env, headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2ce9b1a9ae0344a1ccfdff343ddd3e761d9f2ffad5eb71dfdf9d796779dd1bd2"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6bcadb79c2ea4bdad7d712829ab6b584f6fba2445c0e545204296709ee974cd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fb00bff825764fbeb9e85e43d5da3c783cbc9842e4a1408952f5a96b63adf47"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "babec2f90e3d73f0ecc6fcbf566b2b5de4de2b5cad0a0d5c44441dba19ae3240"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
