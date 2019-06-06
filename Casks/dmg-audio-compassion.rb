require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-compassion' do
  version '1.18'
  sha256 '4c537a492f4db6d9ff376dc8ae530aa15b6b5469b22ae18b301125c07f49a649'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/CompassionMac_v#{version}.zip")
  name 'DMG Audio Compassion'
  homepage 'https://dmgaudio.com/compassion'

  pkg "CompassionMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Compassion*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Compassion',
                '~/Library/Preferences/com.dmgaudio.Compassion.plist',
                '/Library/Application Support/DMGAudio/Compassion',
              ]
end
