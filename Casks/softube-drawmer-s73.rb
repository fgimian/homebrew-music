require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-drawmer-s73' do
  version '2.4.11'
  sha256 'dee7c2657500ae11e3236756fa078761f5bb21f3c6f31f18115e7aeb320bd506'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Drawmer_S73-2.4.11-20170330-7740-1bht5zl.zip")
  name 'Softube Drawmer S73'
  homepage 'https://www.softube.com/index.php?id=drawmers73'

  pkg "Softube Drawmer S73 Installer 2.4.11 r270909.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Drawmer_S73.*'

  zap delete: [
                '~/Library/Application Support/Softube/Drawmer S73.txt',
                '/Library/Application Support/Softube/Softube Drawmer S73 Uninstaller #{version}.pkg',
                '/Library/Application Support/Softube/SSX/Drawmer S73.ssx',
              ]
end
