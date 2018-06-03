base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackmeter' do
  version '1.00'
  sha256 '2a9570d8cab1941aacf6ab85c9fac9e9a226635d89c45c6762b2df431ba87680'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/TrackMeterMac_v#{version}.zip")
  name 'DMGAudio TrackMeter'
  homepage 'https://dmgaudio.com/trackmeter'

  pkg "TrackMeterMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackMeter*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackMeter',
                '~/Library/Preferences/com.dmgaudio.TrackMeter.plist',
                '/Library/Application Support/DMGAudio/TrackMeter',
              ]
end
