cask "quicknetstats@beta" do
  version "3.0.0-Beta-5"
  sha256 "474c5f6e8ea244ccd90ff275cec2949db3c9e27fd644383e31085384fde6617e"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-5/QuickNetStats.app.zip"
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
