require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'dmgaudio-equality' do
  version '1.30'
  sha256 'e18cc6b48d66a0072fe681bd139899bbbfc150d8c3d13381e0604a425d822cd1'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'DMGAudio',
      "DMGAudio EQuality v#{version}",
      "EQualityMac_v#{version}.zip"
    )
  )
  name 'DMGAudio EQuality'
  homepage 'https://dmgaudio.com/products_equality.php'

  pkg "EQualityMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuality*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuality',
                '~/Library/Preferences/com.dmgaudio.EQuality.plist',
                '/Library/Application Support/DMGAudio/EQuality'
              ]
end
