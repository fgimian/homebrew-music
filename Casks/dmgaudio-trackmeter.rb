require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackmeter' do
  version '1.01'
  sha256 'e30714c4cae6f096db503e23bc32b3593f98a09b1bd8833149d7a8c8dbbcc50e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/TrackMeterMac_v#{version}.zip")
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
