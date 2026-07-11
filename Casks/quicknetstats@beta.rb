cask "quicknetstats@beta" do
  version "3.0.0-Beta-7"
  sha256 "ac4a051bf5311ac3e60128ecba81691d8661aa4bd7a94732a98fc1a937ff5e9c"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-7/QuickNetStats.app.zip"
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
