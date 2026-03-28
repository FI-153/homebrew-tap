cask "quicknetstats@beta" do
  version "2.2.0-Beta-1"
  sha256 "b30dbe4b6f325e0f3b8360116a04268185b00f7ce4360a825983ca4e2109b60b"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.2.2.0-Beta-1/QuickNetStats.app.zip"
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
