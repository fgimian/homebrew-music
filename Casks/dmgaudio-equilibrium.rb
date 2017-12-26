require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'dmgaudio-equilibrium' do
  version '1.55'
  sha256 'd545de1e23feed6ca0b37d7fc1e1321c3116ba9d2968250ff38220a9de82af65'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/DMGAudio/EQuilibriumMac_v#{version}.zip")
  name 'DMGAudio EQuilibrium'
  homepage 'https://dmgaudio.com/equilibrium'

  pkg "EQuilibriumMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuilibrium*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuilibrium',
                '~/Library/Preferences/com.dmgaudio.EQuilibrium.plist',
                '/Library/Application Support/DMGAudio/EQuilibrium',
              ]
end
