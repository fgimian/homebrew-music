require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-dualism' do
  version '1.08'
  sha256 'cf11325ad4387d3c306cc3abe37782e61f4404b86d7b0a6da963acec0649de51'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/DualismMac_v#{version}.zip")
  name 'DMG Audio Dualism'
  homepage 'https://dmgaudio.com/dualism'

  pkg "DualismMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.Dualism*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/Dualism',
                '~/Library/Preferences/com.dmgaudio.Dualism.plist',
                '/Library/Application Support/DMGAudio/Dualism',
              ]
end
