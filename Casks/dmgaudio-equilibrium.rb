cask 'dmgaudio-equilibrium' do
  version '1.51'
  sha256 '5df4cec959399554e40e7897f731f49b081c233a78a9e1ae1f0c2c91ea46ae04'

  url "http://www.dmgaudio.com/dl/EQuilibrium_v#{version}/EQuilibriumMac_v#{version}.zip"
  name 'DMG Audio EQuilibrium'
  homepage 'http://dmgaudio.com/products_equilibrium.php'
  license :commercial

  pkg "EQuilibriumMac_v#{version}.pkg"

  uninstall pkgutil: 'com.dmgaudio.pkg.EQuilibrium*'

  zap delete: [
                '~/Library/Preferences/com.dmgaudio.EQuilibrium.plist',
                '~/Library/Application Support/DMGAudio/EQuilibrium',
              ]
end
