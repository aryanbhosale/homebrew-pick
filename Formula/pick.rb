class Pick < Formula
  desc "Extract values from anything — JSON, YAML, TOML, .env, HTTP headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "24feb8b5b67338087ad8f92f02e08ca18893383f5bb25681e9d404047593ad94"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f8f1e518b43b3216691589990190aeaf71d3582ce9aadcf2e6462cade01bbc07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca50d8c8d69682fb820c290998f35da0356745e2539e33fb47eca2d05dbd5614"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd3e38b3939ef6e4a77c6536efb81a69f73d205dce7d1b8448727118bdaf325d"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
