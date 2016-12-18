require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tube-delay' do
  version '2.3.90'
  sha256 'cdc259b031b30ca2ff7692d09b1280c8a29f64a069d3e309d70c48c8aa705529'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Tube_Delay-2.3.90-20161021-20617-nwzh55.zip")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg "Softube Tube Delay Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay.*'

  zap delete: [
                '~/Library/Application Support/Softube/Tube Delay.txt',
                '/Library/Application Support/Softube/Softube Tube Delay Uninstaller #{version}.pkg',
              ]
end
