require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-drawmer-s73' do
  version '2.4.36'
  sha256 'a46f7d09f056f16ff9440077f812ae900ff6ff7e88b1eb255125ff6ed86cbe0c'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Drawmer_S73-2.4.36-20171117-34332-1ql9nzh.zip")
  name 'Softube Drawmer S73'
  homepage 'https://www.softube.com/index.php?id=drawmers73'

  pkg 'Softube Drawmer S73 Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Drawmer_S73.*'

  zap delete: [
                '~/Library/Application Support/Softube/Drawmer S73.txt',
                "/Library/Application Support/Softube/Softube Drawmer S73 Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/Drawmer S73.ssx',
              ]
end
