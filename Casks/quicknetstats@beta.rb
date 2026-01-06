cask "quicknetstats@beta" do
  version "2.1.0-beta.2"
  sha256 "3632df12f6aa0da9e61e40004e982f3c45954ffa6bb37893749a14589dfd63b5"

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
