cask 'dmgaudio-expurgate' do
  version '1.02'
  sha256 '65d9692a853f2098ee74dd307d316293f22c6bde07678cc62b72e4c08051b41b'

  url "https://dmgaudio.com/dl/Expurgate_v#{version}/ExpurgateMac_v#{version}.zip"
  name 'DMGAudio Expurgate'
  homepage 'https://dmgaudio.com/products_expurgate.php'

  pkg "ExpurgateMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Expurgate*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Expurgate',
                '~/Library/Preferences/com.dmgaudio.Expurgate.plist',
                '/Library/Application Support/DMGAudio/Expurgate'
              ]
end
