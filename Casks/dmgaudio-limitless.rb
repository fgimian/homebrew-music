require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-limitless' do
  version '1.05'
  sha256 '6c697346ccfcbcb9236cf9dbd79b35ca29080d0946eade51b4bf0438bb6c7160'

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
