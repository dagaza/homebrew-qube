cask "qube" do
  version "1.3.55"

  # Native wheels (llama.cpp Metal, onnxruntime, ctranslate2) are architecture
  # specific, so one DMG is shipped per architecture and Homebrew selects the
  # matching download.
  on_arm do
    sha256 "7fdc83157c8e84f7b912faa26149096ef804f57ed6a1dbcaf9ea536f60ed1540"

    url "https://github.com/dagaza/Qube/releases/download/v#{version}/Qube-#{version}-arm64.dmg",
        verified: "github.com/dagaza/Qube/"
  end
  on_intel do
    sha256 "24e5d7debad8224ec70ff74cf2bf088cbbda547ada3767a1d45bbefe2256da36"

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
