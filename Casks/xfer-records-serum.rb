base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'xfer-records-serum' do
  version '1.21b5'
  sha256 '00e5deded5d656f61b016f2efe32b8fc9e3c65379aef6d3d4c09819e4ef40a40'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Xfer Records/Install_Xfer_Serum_#{version.no_dots}.dmg")
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
