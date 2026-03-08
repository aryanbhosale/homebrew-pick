class Pick < Formula
  desc "Extract values from anything — JSON, YAML, TOML, .env, HTTP headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a18263a95ff81356444f728af5ec7acb28c8f32dbfccf53ad7f5e11323b0964d"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "35f52cd2b29c1eb75160961420088b6bd953a4b4b2396ff495fb62ec7122a294"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d249038366a5cda4288a79e0e223b81680c8febab720d7b98e44f14f71474e94"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7079dcc044f99c6b1f366bf81ab0ba6b8f5955a989a28d587377c7e462bfa6e3"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
