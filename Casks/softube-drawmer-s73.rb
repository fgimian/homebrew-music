require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-drawmer-s73' do
  version '2.4.48'
  sha256 '24e264345a9931cc7ca175e6e019671e3b2d82692876c53b387ab8976e64cfec'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Drawmer_S73-2.4.48-20180306-84192-1wnnka1.zip")
  name 'Softube Drawmer S73'
  homepage 'https://www.softube.com/index.php?id=drawmers73'

  pkg 'Softube Drawmer S73 Installer 2.4.48 r277255.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Drawmer_S73.*'

  zap delete: [
                '~/Library/Application Support/Softube/Drawmer S73.txt',
                "/Library/Application Support/Softube/Softube Drawmer S73 Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/Drawmer S73.ssx',
              ]
end
