cask "macskk" do
  version "1.2.0"
  sha256 ""

  url "https://github.com/mtgto/macSKK/releases/download/#{version}/macSKK-#{version}.dmg"
  name "macSKK"
  desc "Yet Another macOS SKK Input Method"
  homepage "https://github.com/mtgto/macSKK"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: ">= 13.3"

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
