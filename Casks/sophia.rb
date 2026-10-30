cask "sophia" do
  version "0.1.0"

  on_arm do
    sha256 "c706cd715df3a48f004cb6eee8401c8bff0e55180cec170f20f00b98ae8c41ed"
    url "https://github.com/AhmedWanneni/davinci-notes-workspace/releases/download/v#{version}/Sophia_#{version}_aarch64.dmg",
        verified: "github.com/AhmedWanneni/davinci-notes-workspace/"
  end

  on_intel do
    sha256 :no_check
    url "https://github.com/AhmedWanneni/davinci-notes-workspace/releases/download/v#{version}/Sophia_#{version}_x64.dmg",
        verified: "github.com/AhmedWanneni/davinci-notes-workspace/"
  end

  name "Sophia"
  desc "Local-first, privacy-focused knowledge base and networked note-taking app"
  homepage "https://sophia-notes.pages.dev"

  auto_updates false
  depends_on macos: ">= :big_sur"

  app "Sophia.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Sophia.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.sophia.notes",
    "~/Library/Caches/com.sophia.notes",
    "~/Library/Preferences/com.sophia.notes.plist",
    "~/Library/Saved Application State/com.sophia.notes.savedState",
  ]
end
