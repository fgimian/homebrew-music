require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-tracklimit' do
  version '1.02'
  sha256 'e42867275341c9c9c6d12b78e8ffcc80dec2c99d9fd0472e96789161326dd315'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/TrackLimitMac_v#{version}.zip")
  name 'DMG Audio TrackLimit'
  homepage 'https://dmgaudio.com/tracklimit'

  pkg "TrackLimitMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackLimit*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackLimit',
                '~/Library/Preferences/com.dmgaudio.TrackLimit.plist',
                '/Library/Application Support/DMGAudio/TrackLimit',
              ]
end
