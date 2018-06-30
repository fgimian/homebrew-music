require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-equality' do
  version '1.31'
  sha256 '51fa0c7d566f8df7ab35ab2da119af64e52eb32e5f0274fe1c81b38ff9baed18'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/EQualityMac_v#{version}.zip")
  name 'DMGAudio EQuality'
  homepage 'https://dmgaudio.com/equality'

  pkg "EQualityMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuality*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuality',
                '~/Library/Preferences/com.dmgaudio.EQuality.plist',
                '/Library/Application Support/DMGAudio/EQuality',
              ]
end
