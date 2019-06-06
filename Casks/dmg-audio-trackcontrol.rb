require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-trackcontrol' do
  version '1.02'
  sha256 '23af0670cc499ff399f46aede0f04b44e04d02b7c8ca168e0d0e97c360f52aa0'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/TrackControlMac_v#{version}.zip")
  name 'DMG Audio TrackControl'
  homepage 'https://dmgaudio.com/trackcontrol'

  pkg "TrackControlMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackControl*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackControl',
                '~/Library/Preferences/com.dmgaudio.TrackControl.plist',
                '/Library/Application Support/DMGAudio/TrackControl',
              ]
end
