cask "quicknetstats@beta" do
  version "3.1.0-Beta-1"
  sha256 "27023fe913d79dfb9db7d29b90d4944e57dd2a55e9a6d8ae2245ad542c1f93b7"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.1.0-Beta-1/QuickNetStats.app.zip"
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
