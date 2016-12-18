require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'softube-fet-compressor' do
  version '2.3.90'
  sha256 '33ad2996c195b9936040fc1050b712381796db5fa3fce537d9e69e31ff54522b'

  url URI::encode("file://#{base_dir}/Softube/FET_Compressor-2.3.90-20161021-20617-ijpuob.zip")
  name 'Softube FET Compressor'
  homepage 'https://www.softube.com/index.php?id=fc'

  pkg "Softube FET Compressor Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_FET_Compressor.*'

  zap delete: [
                '/Library/Application Support/Softube/FET Compressor.txt',
                '/Library/Application Support/Softube/Softube FET Compressor Uninstaller #{version}.pkg',
                '/Library/Application Support/Softube/SSX/FET Compressor.ssx'
              ]
end
