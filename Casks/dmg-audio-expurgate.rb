require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-expurgate' do
  version '1.04'
  sha256 '754efe84c626487520f281b4833e48d74f2988508b3ca73d04055121d6ccd93e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/ExpurgateMac_v#{version}.zip")
  name 'DMG Audio Expurgate'
  homepage 'https://dmgaudio.com/expurgate'

  pkg "ExpurgateMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Expurgate*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Expurgate',
                '~/Library/Preferences/com.dmgaudio.Expurgate.plist',
                '/Library/Application Support/DMGAudio/Expurgate',
              ]
end
