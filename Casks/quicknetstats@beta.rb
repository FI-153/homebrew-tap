cask "quicknetstats@beta" do
  version "3.0.0-Beta-3"
  sha256 "d8e1a6958130553376cfd5360e11781ea69fb53d85e19f91878bc0ac67cc2796"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-3/QuickNetStats.app.zip"
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
