require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-limitless' do
  version '1.07'
  sha256 '4caef51012996a9a79b6e7c3a48daf1287c178d461fd25d1a409341b94ed8080'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/LimitlessMac_v#{version}.zip")
  name 'DMG Audio Limitless'
  homepage 'https://dmgaudio.com/limitless'

  pkg "LimitlessMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Limitless*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Limitless',
                '~/Library/Preferences/com.dmgaudio.Limitless.plist',
                '/Library/Application Support/DMGAudio/Limitless',
              ]
end
