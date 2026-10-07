cask "explorer-macos" do
  version "1.2.1"
  sha256 "c24c167fc9a46192877a26b73c59b71ec9c06b80d56700fc46601ff28f4dc59c"

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
