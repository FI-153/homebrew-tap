cask "quicknetstats@beta" do
  version "3.0.0-Beta-1"
  sha256 "578a1c5c8a524c5b5931d40b82a0ee6c233ac2a1d68c9f2f2e2db446350615c1"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-1/QuickNetStats.app.zip"
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
