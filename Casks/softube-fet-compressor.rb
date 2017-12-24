require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-fet-compressor' do
  version '2.4.11'
  sha256 'e8fa8bb814f5ff5e005c098f4c7f2311904cec6b14c425c1f7449075aff641c6'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/FET_Compressor-2.4.11-20170330-7740-aj8tv3.zip")
  name 'Softube FET Compressor'
  homepage 'https://www.softube.com/index.php?id=fc'

  pkg 'Softube FET Compressor Installer 2.4.11 r270909.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_FET_Compressor.*'

  zap delete: [
                '/Library/Application Support/Softube/FET Compressor.txt',
                "/Library/Application Support/Softube/Softube FET Compressor Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/FET Compressor.ssx',
              ]
end
