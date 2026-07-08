cask "quicknetstats@beta" do
  version "3.0.0-Beta-6"
  sha256 "b01860bf95d80d5774607af931ead6b861ba51a1242f4cac8157b7f086415b19"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-6/QuickNetStats.app.zip"
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
