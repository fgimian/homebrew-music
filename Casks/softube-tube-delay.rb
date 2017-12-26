require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tube-delay' do
  version '2.4.36'
  sha256 '7f58e32ba389a2b2ce0ae02677f003359e43b945e387c685c1075034c9273505'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Tube_Delay-2.4.36-20171117-34332-awxd3z.zip")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg 'Softube Tube Delay Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay.*'

  zap delete: [
                '~/Library/Application Support/Softube/Tube Delay.txt',
                "/Library/Application Support/Softube/Softube Tube Delay Uninstaller #{version}.pkg",
              ]
end
