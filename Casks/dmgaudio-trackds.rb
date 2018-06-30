require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackds' do
  version '1.01'
  sha256 '5bcf6d1bcfb872b285689f9db1e91fa9aea09fc090f0633ebd9dd95887e83545'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/TrackDSMac_v#{version}.zip")
  name 'DMGAudio TrackDS'
  homepage 'https://dmgaudio.com/trackds'

  pkg "TrackDSMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackDS*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackDS',
                '~/Library/Preferences/com.dmgaudio.TrackDS.plist',
                '/Library/Application Support/DMGAudio/TrackDS',
              ]
end
