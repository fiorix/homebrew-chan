# Rendered by packaging/distros/homebrew/make-homebrew-package.sh, which
# fills the version and tarball checksum from a GA release; CI pushes the
# result to the fiorix/homebrew-chan tap at this relative path. A
# prebuilt-binary formula is fine in a personal tap (homebrew-core rules do
# not apply). The tarball asset name must match
# web/packages/marketing/scripts/release-assets.mjs (cliAssets).
class Chan < Formula
  desc "Headless terminal multiplexer and workspace manager"
  homepage "https://chan.app/"
  # No version stanza: brew scans it from the /v0.95.1/ URL path and
  # audit rejects an explicit duplicate.
  url "https://github.com/fiorix/chan/releases/download/v0.95.1/chan-aarch64-apple-darwin.tar.gz"
  sha256 "75d8a49c992954572253fd9077e00322bcfb55a489c32c8a29fd6243e1d48a4f"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  # Only darwin-aarch64 tarballs are published.
  depends_on arch: :arm64
  depends_on :macos

  def install
    # Tarball root: chan, LICENSE, README.md (release.yml stages `-C staging .`).
    bin.install "chan"
    # Same argv[0] dispatch install.sh sets up: cs is the control-socket CLI.
    bin.install_symlink "chan" => "cs"
    prefix.install "LICENSE"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      The Chan Desktop cask (fiorix/chan/chan-desktop) provides the same
      `chan` and `cs` commands via ~/.local/bin; install one or the other.

      Prefer `brew upgrade chan` over `chan upgrade`: the self-updater
      replaces the binary in place and Homebrew's recorded version lags.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chan --version")
  end
end
