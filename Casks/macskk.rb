cask "macskk" do
  version "2.8.0"
  sha256 "e8aff6f6d0d0e9fd5cdf55e25c1eccd88da49647cf9a68cf214462d8c5938fc7"

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
