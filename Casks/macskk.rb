cask "macskk" do
  version "1.11.1"
  sha256 "629e2636eab4743b5f6a27a55299d5908395397c3267afbdde9c7263222c69c4"

  url "https://github.com/mtgto/macSKK/releases/download/#{version}/macSKK-#{version}.dmg"
  name "macSKK"
  desc "Yet Another macOS SKK Input Method"
  homepage "https://github.com/mtgto/macSKK"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  # use installer command becasuse pkg command always requires sudo even if destination is user home directory.
  # pkg "macSKK-#{version}.pkg"
  installer script: {
    executable: "/usr/sbin/installer",
    args: ["-pkg", "#{staged_path}/macSKK-#{version}.pkg", "-target", "CurrentUserHomeDirectory"]
  }

  zap trash: [
    "~/Library/Containers/net.mtgto.inputmethod.macSKK",
  ]
end
