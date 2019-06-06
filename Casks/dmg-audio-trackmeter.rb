require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-trackmeter' do
  version '1.02'
  sha256 '3b920d96c426a4be50a001a953f489f8295bd1905e911a015d139054fc558d66'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/TrackMeterMac_v#{version}.zip")
  name 'DMG Audio TrackMeter'
  homepage 'https://dmgaudio.com/trackmeter'

  pkg "TrackMeterMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackMeter*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackMeter',
                '~/Library/Preferences/com.dmgaudio.TrackMeter.plist',
                '/Library/Application Support/DMGAudio/TrackMeter',
              ]
end
