require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-equick' do
  version '1.14'
  sha256 '6f4921dabe0fbf57f08787b2cd3e09dd3a9b0364f72610de0995032dd8cd522f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/EQuickMac_v#{version}.zip")
  name 'DMG Audio EQuick'
  homepage 'https://dmgaudio.com/equick'

  pkg "EQuickMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuick*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuick',
                '~/Library/Preferences/com.dmgaudio.EQuick.plist',
                '/Library/Application Support/DMGAudio/EQuick',
              ]
end
