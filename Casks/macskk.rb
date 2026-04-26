cask "macskk" do
  version "2.12.2"
  sha256 "a2dfd588f1901fb7472997d7bee22bdd2a0b363be4052a176fb2a4ae55b1b7c0"

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
