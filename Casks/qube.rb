cask "qube" do
  version "1.3.60"

  # Native wheels (llama.cpp Metal, onnxruntime, ctranslate2) are architecture
  # specific, so one DMG is shipped per architecture and Homebrew selects the
  # matching download.
  on_arm do
    sha256 "408c4c78ab6911fb6a24b1b693f81553dc0e05b82e097a3fd84a34ef3d95bff8"

    url "https://github.com/dagaza/Qube/releases/download/v#{version}/Qube-#{version}-arm64.dmg",
        verified: "github.com/dagaza/Qube/"
  end
  on_intel do
    sha256 "5299abdd2639802e5f0f104c5768c62676b695da3b5fde2d36c5651715be4e3e"

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
