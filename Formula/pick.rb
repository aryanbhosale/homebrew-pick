class Pick < Formula
  desc "Extract, filter, and transform values from JSON, YAML, TOML, .env, headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "06ff7b0cbb5a07608215c548e2f3bda27d9ba16ae32b371cfa47b58ea4dd37d6"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7a64fa31d992c2dbb0a5b3d0fe3e542f037a83e559987fd35662768ec165e198"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "948b77d58552e0d2b6107604ccbc64529c3859ce669c1090efe477eaa48ed0b5"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d70006afc255b05868c878ded692dcf41b963df895b0301feed4f2d4ceca3003"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
