cask "qube" do
  version "1.3.58"

  # Native wheels (llama.cpp Metal, onnxruntime, ctranslate2) are architecture
  # specific, so one DMG is shipped per architecture and Homebrew selects the
  # matching download.
  on_arm do
    sha256 "23afd1194e7cb5562259d8da5254db95b5c4361c91db5ed4354fe3ce13aab2a2"

    url "https://github.com/dagaza/Qube/releases/download/v#{version}/Qube-#{version}-arm64.dmg",
        verified: "github.com/dagaza/Qube/"
  end
  on_intel do
    sha256 "7aed12deb5e8755277d1a132171620a102dcda2b26f0708c2bd4c4f454fe2b53"

    url "https://github.com/dagaza/Qube/releases/download/v#{version}/Qube-#{version}-x86_64.dmg",
        verified: "github.com/dagaza/Qube/"
  end

  name "Qube"
  desc "Local hardware-accelerated AI desktop assistant"
  homepage "https://github.com/dagaza/Qube"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :monterey

  app "Qube.app"

  zap trash: [
    "/Applications/Qube.app",
    "~/.qube",
    "~/Applications/Qube.app",
    "~/Library/Application Support/Qube",
    "~/Library/Caches/com.dagaza.Qube",
    "~/Library/Logs/Qube",
    "~/Library/Preferences/com.dagaza.Qube.plist",
    "~/Library/Saved Application State/com.dagaza.Qube.savedState",
  ]

  caveats <<~EOS
    Qube is distributed unsigned via the dagaza/qube custom tap (no Apple Developer ID).
    macOS Gatekeeper may block the app on first launch. Use System Settings → Privacy & Security → Open Anyway,
    or remove the quarantine attribute after install:
      xattr -dr com.apple.quarantine "/Applications/Qube.app"
  EOS
end
