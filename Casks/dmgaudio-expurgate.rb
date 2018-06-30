require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-expurgate' do
  version '1.03'
  sha256 '4f79adcc7ad2f467c9ea540b80ab2c332f330ddede759612bf9c13a533b27ea1'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/ExpurgateMac_v#{version}.zip")
  name 'DMGAudio Expurgate'
  homepage 'https://dmgaudio.com/expurgate'

  pkg "ExpurgateMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Expurgate*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Expurgate',
                '~/Library/Preferences/com.dmgaudio.Expurgate.plist',
                '/Library/Application Support/DMGAudio/Expurgate',
              ]
end
