# homebrew-qube

Homebrew tap for [Qube](https://github.com/dagaza/Qube) — a local, privacy-first AI desktop assistant.

## Install

```bash
brew tap dagaza/qube
brew install --cask qube
```

## Upgrade later
```
brew upgrade --cask qube
```

## First launch (unsigned build)
Qube is distributed unsigned via this tap (no Apple Developer ID). If macOS blocks the app:

Open System Settings → Privacy & Security → Open Anyway, or
Run: xattr -dr com.apple.quarantine "/Applications/Qube.app"

## What gets installed
Homebrew downloads the release DMG for your Mac (Apple Silicon or Intel) from GitHub Releases and installs Qube.app.

## More info
* **Main project:** https://github.com/dagaza/Qube
* **Docs:** https://github.com/dagaza/Qube/tree/main/docs/user
* **Issues**: https://github.com/dagaza/Qube/issues

## Maintainers
This tap is updated automatically on each Qube release when HOMEBREW_AUTO_SUBMIT is enabled on the main repository. Cask definitions live in Casks/qube.rb.

