require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-compassion' do
  version '1.17'
  sha256 'ed87e9ba6ccf08c9c9af53f35c4c7ef0e9a01fd0b6dd3fd9f6459cb4c01ac4c3'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/CompassionMac_v#{version}.zip")
  name 'DMGAudio Compassion'
  homepage 'https://dmgaudio.com/compassion'

  pkg "CompassionMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Compassion*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Compassion',
                '~/Library/Preferences/com.dmgaudio.Compassion.plist',
                '/Library/Application Support/DMGAudio/Compassion',
              ]
end
