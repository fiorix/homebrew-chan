# homebrew-chan

This tap is retired. From chan v0.125.0 the `chan` formula and the `chan-desktop` cask are published from [fiorix/homebrew-tap](https://github.com/fiorix/homebrew-tap) (tap `fiorix/tap`), and nothing is published here any more. The repository stays, archived, so `brew update` keeps working on a Mac that still has it tapped.

## Moving an existing install

`brew update` names each package installed from this tap and prints the commands that move it. For both packages they come to:

```sh
brew tap fiorix/tap
brew trust fiorix/tap
brew reinstall chan-desktop   # the app, if installed
brew reinstall chan           # the CLI, if installed
brew untap fiorix/chan
```

`brew reinstall` installs each package from `fiorix/tap` at its current version. The app's own data is kept; do not pass `--zap`.

If `fiorix/tap` was already tapped and trusted when `brew update` ran, brew moves both packages by itself and only `brew untap fiorix/chan` is left. It reinstalls the app from `fiorix/tap` after printing that `chan-desktop` "has been moved to Homebrew" with a `brew uninstall --cask --force chan-desktop` command; skip that command, since it would remove the app brew has just installed from `fiorix/tap`. The CLI moves to `fiorix/tap` at its installed version, and `brew upgrade chan` takes it from there.

## New installs

```sh
brew install --cask fiorix/tap/chan-desktop
```

```sh
brew install fiorix/tap/chan
```

Install one or the other, not both: the app provides the same `chan` and `cs` commands through `~/.local/bin` shims it maintains itself. See the [new tap's README](https://github.com/fiorix/homebrew-tap#chan) for updates.
