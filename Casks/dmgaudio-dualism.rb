cask 'dmgaudio-dualism' do
  version '1.06'
  sha256 '0e5e25c26ffb80264b75af01413d7bad45575ce316361fd5e23f717973e37b56'

  url "https://dmgaudio.com/dl/Dualism_v#{version}/DualismMac_v#{version}.zip"
  name 'DMGAudio Dualism'
  homepage 'https://dmgaudio.com/products_dualism.php'

  pkg "DualismMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Dualism*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Dualism',
                '~/Library/Preferences/com.dmgaudio.Dualism.plist',
                '/Library/Application Support/DMGAudio/Dualism'
              ]
end
