require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'dmgaudio-expurgate' do
  version '1.02'
  sha256 '65d9692a853f2098ee74dd307d316293f22c6bde07678cc62b72e4c08051b41b'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/ExpurgateMac_v#{version}.zip")
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
