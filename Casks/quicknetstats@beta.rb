cask "quicknetstats@beta" do
  version "3.0.0-Beta-2"
  sha256 "5db1c290857e608e8295a83cb6f31fab1bd52c90f383c3afc8f601f5d4cb9c85"

  url "https://github.com/FI-153/QuickNetStats/releases/download/V.3.0.0-Beta-2/QuickNetStats.app.zip"
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
