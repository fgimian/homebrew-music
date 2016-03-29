cask 'dmgaudio-dualism' do
  version '1.03'
  sha256 '978b634516385ba94f82cdecd786b6e05e4e12da2f9b75d4b80fc21471d06e8a'

  url "http://www.dmgaudio.com/dl/Dualism_v#{version}/DualismMac_v#{version}.zip"
  name 'DMG Audio Dualism'
  homepage 'http://dmgaudio.com/products_dualism.php'
  license :commercial

  pkg "DualismMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Dualism*'

  zap delete: [
                '~/Library/Preferences/com.dmgaudio.Dualism.plist',
                '~/Library/Application Support/DMGAudio/Dualism',
              ]
end
