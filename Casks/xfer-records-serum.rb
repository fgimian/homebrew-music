require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'xfer-records-serum' do
  version '1.25b2'
  sha256 'c6c0b7ccb76cc669f59b4d1f2388a0180bd6361230b90e6cc16725e47199cea2'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Xfer Records/Install_Xfer_Serum_#{version.no_dots}.dmg")
  name 'Xfer Records Serum'
  homepage 'https://www.xferrecords.com/products/serum'

  pkg 'Install_Xfer_Serum.pkg'

  uninstall pkgutil: [
                       'com.xfer.Serum.*',
                       'com.xfer.serum.*',
                       'com.xfer.serumFX.*',
                     ]

  zap delete: [
                '~/Library/Application Support/com.xferrecords.serum',
                '~/Library/Preferences/Serum.cfg',
              ]
end
