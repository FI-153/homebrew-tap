cask "quicknetstats@beta" do
  version "2.1.0-beta.1"
  sha256 "deb8f954c039136205d1a2ba3ed0ca6221d9c35852968009c28239b938978089"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V#{version}/QuickNetStats.app.zip"
  name "QuickNetStats (Beta)"
  desc "Development version of QuickNetStats"
  homepage "https://github.com/FI-153/QuickNetStats"

  # Prevents users from having both versions installed simultaneously 
  conflicts_with cask: "quicknetstats"

  app "QuickNetStats.app"

  livecheck do
    url "https://github.com/FI-153/QuickNetStats/releases"
    strategy :github_latest
  end

  zap trash: [
    "~/Library/Preferences/com.federicoimberti.quicknetstats.plist", # Update with your actual bundle ID
    "~/Library/Saved Application State/com.federicoimberti.quicknetstats.savedState",
  ]
end
