require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-phasis' do
  version '1.0.1'
  sha256 '8975338e1697eaa275df3cc22b78d2602e520e4e73ae0345fcc729242c6b78ce'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Phasis.iso")
  name 'Native Instruments Phasis'
  homepage 'https://www.native-instruments.com/en/specials/happy-holidays-2017/download-phasis/'

  pkg "Phasis #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Phasis.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Phasis',
                '~/Library/Preferences/com.native-instruments.Phasis.plist',
                '/Library/Application Support/Native Instruments/Phasis',
                '/Library/Preferences/com.native-instruments.Phasis.plist',
              ]
end
