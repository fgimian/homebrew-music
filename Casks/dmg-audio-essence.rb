require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-essence' do
  version '1.06'
  sha256 'da4940678ef5745d58a6545af15200124b71324b70e8e627ff846c29a33b7b45'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/EssenceMac_v#{version}.zip")
  name 'DMG Audio Essence'
  homepage 'https://dmgaudio.com/essence'

  pkg "EssenceMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Essence*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Essence',
                '~/Library/Preferences/com.dmgaudio.Essence.plist',
                '/Library/Application Support/DMGAudio/Essence',
              ]
end
