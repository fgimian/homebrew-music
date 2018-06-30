require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-essence' do
  version '1.05'
  sha256 'e564ed1d203c5446ea683015490d8bdb0ccd0a431c31ea8e7002a5cff0faf87e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/EssenceMac_v#{version}.zip")
  name 'DMGAudio Essence'
  homepage 'https://dmgaudio.com/essence'

  pkg "EssenceMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Essence*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Essence',
                '~/Library/Preferences/com.dmgaudio.Essence.plist',
                '/Library/Application Support/DMGAudio/Essence',
              ]
end
