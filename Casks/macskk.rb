cask "macskk" do
  version "1.9.0"
  sha256 "337f3755927c26a3e3420d1c070488e1913c48a0a74fa1626567a998bf43461e"

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
