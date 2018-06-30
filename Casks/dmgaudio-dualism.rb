require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-dualism' do
  version '1.07'
  sha256 '79c4fea6aa531fc917c07c634da02a2c7bebf2a4febfc9087f78577e023c00b7'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/DualismMac_v#{version}.zip")
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
