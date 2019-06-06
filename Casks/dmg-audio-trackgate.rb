require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-trackgate' do
  version '1.02'
  sha256 '99442e60e0994db326c2d60a2241df661325bfbf056170e7eb998a3c92b00332'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/TrackGateMac_v#{version}.zip")
  name 'DMG Audio TrackGate'
  homepage 'https://dmgaudio.com/trackgate'

  pkg "TrackGateMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackGate*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackGate',
                '~/Library/Preferences/com.dmgaudio.TrackGate.plist',
                '/Library/Application Support/DMGAudio/TrackGate',
              ]
end
