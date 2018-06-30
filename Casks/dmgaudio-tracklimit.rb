require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-tracklimit' do
  version '1.01'
  sha256 '60cad0fe2d52b99e1faf2339af16505e7d20d6a8aa9dcdf992ed783ecaf4ccaf'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/TrackLimitMac_v#{version}.zip")
  name 'DMGAudio TrackLimit'
  homepage 'https://dmgaudio.com/tracklimit'

  pkg "TrackLimitMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.TrackLimit*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/TrackLimit',
                '~/Library/Preferences/com.dmgaudio.TrackLimit.plist',
                '/Library/Application Support/DMGAudio/TrackLimit',
              ]
end
