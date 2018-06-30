require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-trackcontrol' do
  version '1.01'
  sha256 '3f74b8e9bf0cfddd0e6501f2ce92d8a88c5e0f188acaa5c801670e025bfdb5ce'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/TrackControlMac_v#{version}.zip")
  name 'DMGAudio TrackControl'
  homepage 'https://dmgaudio.com/trackcontrol'

  pkg "TrackControlMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackControl*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackControl',
                '~/Library/Preferences/com.dmgaudio.TrackControl.plist',
                '/Library/Application Support/DMGAudio/TrackControl',
              ]
end
