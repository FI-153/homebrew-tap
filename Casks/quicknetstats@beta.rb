cask "quicknetstats@beta" do
  version "2.2.0-Beta-2"
  sha256 "223a2c6e7f7361f6000064a7d6887eb092e75b6ac3a2d336a334cb02630ad400"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.2.2.0-Beta-2/QuickNetStats.app.zip"
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
