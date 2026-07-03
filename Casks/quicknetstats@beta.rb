cask "quicknetstats@beta" do
  version "2.2.1-Beta-1"
  sha256 "4d43ee3926c6febe016c829a0fe6cb8fad257037c64e9f7e3606080eb5f6e5a6"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.2.2.1-Beta-1/QuickNetStats.app.zip"
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
