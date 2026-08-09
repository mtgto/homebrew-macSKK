cask "macskk" do
  version "2.18.4"
  sha256 "cd4bbb11a1864bdad689482b0d87756397312ba5dc68c40623391bda5a1fe15c"

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
