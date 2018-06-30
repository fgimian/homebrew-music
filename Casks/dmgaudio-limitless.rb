require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-limitless' do
  version '1.06'
  sha256 '7644c200eeb8a352861def103ca682410454002560b5de14d1f975a71e4c3914'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/LimitlessMac_v#{version}.zip")
  name 'DMGAudio Limitless'
  homepage 'https://dmgaudio.com/limitless'

  pkg "LimitlessMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Limitless*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Limitless',
                '~/Library/Preferences/com.dmgaudio.Limitless.plist',
                '/Library/Application Support/DMGAudio/Limitless',
              ]
end
