cask 'dmgaudio-equilibrium' do
  version '1.53'
  sha256 'af776ba91f2ce155a4e3087847a14e874c0fc4e66605314012f2224e93b8cbd2'

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
