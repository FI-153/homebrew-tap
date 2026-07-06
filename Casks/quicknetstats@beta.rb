cask "quicknetstats@beta" do
  version "3.0.0-Beta-4"
  sha256 "1ce2c6838393d3a6a3216add6827da02de773521f8d4068f0da3658a76503dd2"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-4/QuickNetStats.app.zip"
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
