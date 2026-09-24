# Homebrew Tap for Osh

Casks for [Osh](https://github.com/Hyp4tia/Osh), a native macOS reader, editor and QuickLook
extension for Markdown, Typst and AI `.skill` documents.

## Install

```bash
brew install --cask Hyp4tia/tap/osh
```

The cask depends on `duti` and sets Osh as the default handler for Markdown documents during
install.

## Updating

Osh updates itself through its own updater (Sparkle), so the cask only carries install metadata:

```bash
brew update && brew upgrade --cask osh
```

## First launch

Osh is not notarized with an Apple Developer ID yet, so macOS Gatekeeper may warn on first launch.
Approve it under **System Settings → Privacy & Security**, or clear the quarantine flag:

```bash
xattr -cr "/Applications/Osh.app"
```

If Finder still shows plain-text previews after installing, reset Quick Look:

```bash
qlmanage -r && qlmanage -r cache
```
