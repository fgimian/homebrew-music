cask 'dmgaudio-dualism' do
  version '1.04'
  sha256 'f05a1997ddbe8ccef40dac11f92feb41ffa73ab94bd6d38dd875be9a8a035a9c'

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
