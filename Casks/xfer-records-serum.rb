require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'xfer-records-serum' do
  version '1.0'
  sha256 'a76d095289e9cdc85de88b9c057353de54c98a3ae6dbda04eb821222a6482d80'

  url URI::encode("file://#{base_dir}/Xfer Records/Install_Xfer_Serum.dmg")
  name 'Xfer Records Serum'
  homepage 'https://www.xferrecords.com/products/serum'

  pkg 'Install_Xfer_Serum.pkg'

  uninstall pkgutil: [
                       'com.xfer.Serum.*',
                       'com.xfer.serum.*',
                       'com.xfer.serumFX.*'
                     ]

  zap delete: [
                '~/Library/Application Support/com.xferrecords.serum',
                '~/Library/Preferences/Serum.cfg'
              ]
end
