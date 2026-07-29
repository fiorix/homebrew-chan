# homebrew-chan

Homebrew tap for [Chan](https://chan.app), the modern engineer's IDE. Apple Silicon macOS only.

## Install

The desktop app, `Chan.app` from the signed and notarized release DMG:

```sh
brew install --cask fiorix/chan/chan-desktop
```

The headless CLI, the released `chan` binary plus the `cs` symlink:

```sh
brew install fiorix/chan/chan
```

Install one or the other, not both: the app provides the same `chan` and `cs` commands through `~/.local/bin` shims it maintains itself.

## Updates

The app updates itself; the cask declares `auto_updates`, so `brew upgrade` skips it unless given `--greedy`. The CLI updates through `brew upgrade chan`; prefer that over `chan upgrade` so Homebrew's recorded version stays correct.

## Maintenance

The definitions here are rendered from templates in [fiorix/chan](https://github.com/fiorix/chan) (`packaging/distros/homebrew/`) and pushed by its `publish-downstream` workflow on every GA release. Do not edit them by hand.
