cask "macskk" do
  version "1.6.1"
  sha256 "acd68a769113e3c9909b1b3d5fc487de37e24cf11cbba59a0473a919d5895623"

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
