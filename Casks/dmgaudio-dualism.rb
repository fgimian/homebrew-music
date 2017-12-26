require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'dmgaudio-dualism' do
  version '1.06'
  sha256 '0e5e25c26ffb80264b75af01413d7bad45575ce316361fd5e23f717973e37b56'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/DualismMac_v#{version}.zip")
  name 'DMGAudio Dualism'
  homepage 'https://dmgaudio.com/dualism'

  pkg "DualismMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Dualism*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Dualism',
                '~/Library/Preferences/com.dmgaudio.Dualism.plist',
                '/Library/Application Support/DMGAudio/Dualism',
              ]
end
