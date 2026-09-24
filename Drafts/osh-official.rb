# Draft of the cask for submission to homebrew/homebrew-cask.
# Differences from Casks/osh.rb are deliberate: the official repository does not allow
# `auto_updates`, formula dependencies, or a duti postflight.
cask "osh" do
  version "1.0.10"
  sha256 "44d911fd0a81132bd976c616580d2f1a7ba20f55c820715383cb1043057e1baf"

  url "https://github.com/Hyp4tia/Osh/releases/download/v#{version}/Osh.dmg",
      verified: "github.com/Hyp4tia/Osh/"
  name "Osh"
  desc "Markdown, Typst and .skill reader, editor and QuickLook extension"
  homepage "https://github.com/Hyp4tia/Osh"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Osh.app"

  zap trash: [
    "~/Library/Application Support/Osh",
    "~/Library/Containers/com.zeyadistired.osh",
    "~/Library/Containers/com.zeyadistired.osh.QuickLook",
  ]

  caveats <<~EOS
    If Finder shows plain-text previews after installing, reset Quick Look:
      qlmanage -r && qlmanage -r cache
  EOS
end
