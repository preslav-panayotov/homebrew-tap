cask "explorer-macos" do
  version "1.2.0"
  sha256 "8185773d69cc48831b9cf20c9a28bd7baaf2abe177a4508814489a2285bdba88"

  url "https://github.com/preslav-panayotov/explorer-macos/releases/download/v#{version}/Explorer-#{version}.dmg"
  name "Explorer"
  desc "Windows 11 File Explorer-style file manager for macOS"
  homepage "https://github.com/preslav-panayotov/explorer-macos"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Explorer.app"
  binary "#{appdir}/Explorer.app/Contents/Resources/explorermac"

  zap trash: [
    "~/Library/Caches/com.local.explorer",
    "~/Library/Preferences/com.local.explorer.plist",
    "~/Library/Saved Application State/com.local.explorer.savedState",
  ]

  caveats <<~EOS
    Explorer is ad-hoc signed but not notarized by Apple. If macOS blocks it on first launch,
    right-click Explorer.app in /Applications and choose Open (once).

    The terminal command is installed as: explorermac /path/to/folder
  EOS
end
