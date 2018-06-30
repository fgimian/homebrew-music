require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-equick' do
  version '1.13'
  sha256 'ebfa1110da02d921516095a1116e99a3794dc07acec3af99dbe2f4e036e1dd07'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/EQuickMac_v#{version}.zip")
  name 'DMGAudio EQuick'
  homepage 'https://dmgaudio.com/equick'

  pkg "EQuickMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuick*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuick',
                '~/Library/Preferences/com.dmgaudio.EQuick.plist',
                '/Library/Application Support/DMGAudio/EQuick',
              ]
end
