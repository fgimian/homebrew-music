require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-drawmer-s73' do
  version '2.3.90'
  sha256 '5f17353bd8a315bbd043594702a0ff9bdb2060c40976ecb9188610196ec09b6a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Drawmer_S73-2.3.90-20161021-20617-mevjot.zip")
  name 'Softube Drawmer S73'
  homepage 'https://www.softube.com/index.php?id=drawmers73'

  pkg "Softube Drawmer S73 Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Drawmer_S73.*'

  zap delete: [
                '~/Library/Application Support/Softube/Drawmer S73.txt',
                '/Library/Application Support/Softube/Softube Drawmer S73 Uninstaller #{version}.pkg',
                '/Library/Application Support/Softube/SSX/Drawmer S73.ssx',
              ]
end
