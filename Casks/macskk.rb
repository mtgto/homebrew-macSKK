cask "macskk" do
  version "1.4.0"
  sha256 "7cf21237fff8e574d7670493bbf6e4a40cd1380fddea4c64e36da4144da4e784"

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
