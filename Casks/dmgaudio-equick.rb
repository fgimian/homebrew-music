cask 'dmgaudio-equick' do
  version '1.12'
  sha256 'b686cbf248f9a5646474d7357f80e07ff2ec3dd7372a1b9da3f9fc38b9c421ee'

  url "https://dmgaudio.com/dl/EQuick_v#{version}/EQuickMac_v#{version}.zip"
  name 'DMGAudio EQuick'
  homepage 'https://dmgaudio.com/products_equick.php'

  pkg "EQuickMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuick*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuick',
                '~/Library/Preferences/com.dmgaudio.EQuick.plist',
                '/Library/Application Support/DMGAudio/EQuick',
              ]
end
