cask "qube" do
  version "1.3.52"

  # Native wheels (llama.cpp Metal, onnxruntime, ctranslate2) are architecture
  # specific, so one DMG is shipped per architecture and Homebrew selects the
  # matching download.
  on_arm do
    sha256 "14b62647319673794e4436eeaa31cfd07b2a4ea7ac4ec12d02e473e43305b0c3"

    url "https://github.com/dagaza/Qube/releases/download/v#{version}/Qube-#{version}-arm64.dmg",
        verified: "github.com/dagaza/Qube/"
  end
  on_intel do
    sha256 "96f6e537b07744309689faaf4d3db2224d2442043ce5408a2886f267ddacef5c"

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
