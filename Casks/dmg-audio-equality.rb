require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-equality' do
  version '1.32'
  sha256 '0f15d84f7f06ef4f2b9a9630db71ca6e652575107aaca52dc93b980980ef691c'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/EQualityMac_v#{version}.zip")
  name 'DMG Audio EQuality'
  homepage 'https://dmgaudio.com/equality'

  pkg "EQualityMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuality*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuality',
                '~/Library/Preferences/com.dmgaudio.EQuality.plist',
                '/Library/Application Support/DMGAudio/EQuality',
              ]
end
