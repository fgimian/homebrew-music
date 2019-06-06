require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmg-audio-equilibrium' do
  version '1.57'
  sha256 'b190eeeadd528e83b94b2d47d6042721014e53b982cd37de6644f8cfd4236e1a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMG Audio/EQuilibriumMac_v#{version}.zip")
  name 'DMG Audio EQuilibrium'
  homepage 'https://dmgaudio.com/equilibrium'

  pkg "EQuilibriumMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuilibrium*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuilibrium',
                '~/Library/Preferences/com.dmgaudio.EQuilibrium.plist',
                '/Library/Application Support/DMGAudio/EQuilibrium',
              ]
end
