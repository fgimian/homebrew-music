require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-trackcomp' do
  version '1.03'
  sha256 'd68d43619830325fc5ddaed8887b1135ba82aee71fbbf40815da2a6d6efdbe02'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/TrackCompMac_v#{version}.zip")
  name 'DMG Audio TrackComp'
  homepage 'https://dmgaudio.com/trackcomp'

  pkg "TrackCompMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackComp*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackComp',
                '~/Library/Preferences/com.dmgaudio.TrackComp.plist',
                '/Library/Application Support/DMGAudio/TrackComp',
              ]
end
