class Pick < Formula
  desc "Extract, filter, and transform values from JSON, YAML, TOML, .env, headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1899baa896b311262770a9e07dc7caccfa3f5c304d23ece2b91b71a218bb5bd3"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5dfef67955db39e6962d92da92f045830e2b898eb2a1cfe69eedfeee283de9ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e9e1699bc95f95e4572cb888da1996f8976390d801c0b8bdd03e195ed381999"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "637f76af67e3976fb5b3ccad0a081be502c7812dcb2730bc24eb51abead5a387"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
