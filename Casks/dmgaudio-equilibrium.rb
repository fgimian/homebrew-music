require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dmgaudio-equilibrium' do
  version '1.56'
  sha256 '86f59b6c8c5e0c290ef1639dfc7def149f7ab6ba69854bf15d9d3512ffde49a8'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/DMGAudio/EQuilibriumMac_v#{version}.zip")
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
