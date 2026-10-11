cask "macskk" do
  version "2.21.1"
  sha256 "d6df5ba591d9bec91d3c3e5a6ab7ec6affa7d57c46f4316dcf94e0c6d786fd7d"

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
