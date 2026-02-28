cask "macskk" do
  version "2.10.2"
  sha256 "33e1538413b799cc4370ee26f6d000d927fb0b9e39a4acef06459b046cc48af0"

  url "https://github.com/mtgto/macSKK/releases/download/#{version}/macSKK-#{version}.dmg"
  name "macSKK"
  desc "Yet Another macOS SKK Input Method"
  homepage "https://github.com/mtgto/macSKK"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  pkg "macSKK-#{version}.pkg"

  zap trash: [
    "~/Library/Containers/net.mtgto.inputmethod.macSKK",
  ]
end
