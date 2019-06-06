require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-trackds' do
  version '1.02'
  sha256 '6d31e21ffdc1ffc694c3f369a9d90d3fbcfc85435d2b3301cffb29035ea87435'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/TrackDSMac_v#{version}.zip")
  name 'DMG Audio TrackDS'
  homepage 'https://dmgaudio.com/trackds'

  pkg "TrackDSMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackDS*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackDS',
                '~/Library/Preferences/com.dmgaudio.TrackDS.plist',
                '/Library/Application Support/DMGAudio/TrackDS',
              ]
end
