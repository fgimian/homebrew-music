cask 'dmgaudio-trackmeter' do
  version '1.00'
  sha256 '2a9570d8cab1941aacf6ab85c9fac9e9a226635d89c45c6762b2df431ba87680'

  url "https://dmgaudio.com/dl/TrackMeter_v#{version}/TrackMeterMac_v#{version}.zip"
  name 'DMGAudio TrackMeter'
  homepage 'https://dmgaudio.com/products_TrackMeter.php'

  pkg "TrackMeterMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackMeter*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackMeter',
                '~/Library/Preferences/com.dmgaudio.TrackMeter.plist',
                '/Library/Application Support/DMGAudio/TrackMeter',
              ]
end
