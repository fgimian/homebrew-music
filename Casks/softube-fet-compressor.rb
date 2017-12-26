require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-fet-compressor' do
  version '2.4.36'
  sha256 'dd1cd9c0e2c022aca29acabb2b2fd98103776db11f4704ea0c0fadf6e608ee5f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/FET_Compressor-2.4.36-20171117-34332-rrx6he.zip")
  name 'Softube FET Compressor'
  homepage 'https://www.softube.com/index.php?id=fc'

  pkg 'Softube FET Compressor Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_FET_Compressor.*'

  zap delete: [
                '/Library/Application Support/Softube/FET Compressor.txt',
                "/Library/Application Support/Softube/Softube FET Compressor Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/FET Compressor.ssx',
              ]
end
