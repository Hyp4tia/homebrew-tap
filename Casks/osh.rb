# frozen_string_literal: true

cask "osh" do
  version "1.0.10"
  sha256 "44d911fd0a81132bd976c616580d2f1a7ba20f55c820715383cb1043057e1baf"

  url "https://github.com/Hyp4tia/Osh/releases/download/v#{version}/Osh.dmg",
      verified: "github.com/Hyp4tia/Osh/"
  name "Osh"
  desc "Markdown, Typst and .skill reader, editor and QuickLook extension"
  homepage "https://github.com/Hyp4tia/Osh"

  livecheck do
    url "https://raw.githubusercontent.com/Hyp4tia/Osh/main/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :monterey
  depends_on formula: "duti"

  app "Osh.app"

  postflight_steps do
    # A reader is only useful if it opens the files, so claim Markdown documents by
    # default. Best effort: the step sandbox may block it, and the caveats repeat the
    # command for anyone who needs to run it by hand.
    run "{{HOMEBREW_PREFIX}}/bin/duti",
        args:         ["-s", "com.zeyadistired.osh", "net.daringfireball.markdown", "all"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Osh",
    "~/Library/Containers/com.zeyadistired.osh",
    "~/Library/Containers/com.zeyadistired.osh.QuickLook"
  ]

  caveats <<~EOS
    To make Osh the default app for Markdown files, run:
      duti -s com.zeyadistired.osh net.daringfireball.markdown all

    Osh is not notarized yet, so macOS may show a Gatekeeper warning the first time
    you open it. Approve it in System Settings > Privacy & Security, or run:
      xattr -cr "/Applications/Osh.app"

    If Finder still shows plain-text previews, reset Quick Look:
      qlmanage -r && qlmanage -r cache
  EOS
end
