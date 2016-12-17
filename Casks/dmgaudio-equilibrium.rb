cask 'dmgaudio-equilibrium' do
  version '1.55'
  sha256 'd545de1e23feed6ca0b37d7fc1e1321c3116ba9d2968250ff38220a9de82af65'

  url "https://dmgaudio.com/dl/EQuilibrium_v#{version}/EQuilibriumMac_v#{version}.zip"
  name 'DMGAudio EQuilibrium'
  homepage 'https://dmgaudio.com/products_equilibrium.php'

  pkg "EQuilibriumMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuilibrium*'

  zap delete: [
                '~/Library/Application Support/DMGAudio/EQuilibrium',
                '~/Library/Preferences/com.dmgaudio.EQuilibrium.plist',
                '/Library/Application Support/DMGAudio/EQuilibrium'
              ]
end
