cask "qube" do
  version "1.3.56"

  # Native wheels (llama.cpp Metal, onnxruntime, ctranslate2) are architecture
  # specific, so one DMG is shipped per architecture and Homebrew selects the
  # matching download.
  on_arm do
    sha256 "b775e56a3c1a2b9f0f885d55ac25b0027344cdf14d056924610e551ab84a9116"

    url "https://github.com/dagaza/Qube/releases/download/v#{version}/Qube-#{version}-arm64.dmg",
        verified: "github.com/dagaza/Qube/"
  end
  on_intel do
    sha256 "5f7499dca0ad417a282304d375267104de85fa85f8f0691e1171c4ce5a9de776"

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
