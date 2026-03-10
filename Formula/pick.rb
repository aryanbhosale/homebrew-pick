class Pick < Formula
  desc "Extract, filter, and transform values from JSON, YAML, TOML, .env, headers, logfmt, CSV, and more"
  homepage "https://pick-cli.pages.dev"
  license "MIT"
  version "0.1.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1fa68281cc9470ad48d1cdd2f226c3411185cb63a991665fcdaa0680c06e7f4a"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b2c637bb76f6b784915708072bc90fb05898a55da61366b7a1a088b67ac93224"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bdf9a33dff5ecd3bbe2b5616c819a7cc37197a20a3393f668ad0e90017cf4c4e"
    else
      url "https://github.com/aryanbhosale/pick/releases/download/v#{version}/pick-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "400ec9fbfb431879c7ef45af8804a08b03bf2cf3e12f8d6b0357af87d48f1db9"
    end
  end

  def install
    bin.install "pick"
  end

  test do
    assert_equal "bar", shell_output("echo '{\"foo\":\"bar\"}' | #{bin}/pick foo").strip
  end
end
