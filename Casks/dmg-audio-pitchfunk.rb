require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-pitchfunk' do
  version '1.13'
  sha256 '1a417d6d21730c2abdd7a990016d0eed76357710328184317fdced9a6279dd8c'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/PitchFunkMac_v#{version}.zip")
  name 'DMG Audio PitchFunk'
  homepage 'https://dmgaudio.com/pitchfunk'

  pkg "PitchFunkMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.PitchFunk*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/PitchFunk',
                '~/Library/Preferences/com.dmgaudio.PitchFunk.plist',
                '/Library/Application Support/DMGAudio/PitchFunk',
              ]
end
