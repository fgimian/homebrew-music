require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-6' do
  version '6.2.2'
  sha256 'ad9a1441d912946d8ede23f4ec49f4fcfbba5e20d83e4b06609d16c16d2cabf1'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Reaktor_6_Installer.dmg")
  name 'Native Instruments Reaktor 6'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-6/'

  pkg "Reaktor 6 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Reaktor6.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor 6',
                '~/Library/Preferences/com.native-instruments.Reaktor6.plist',
                '/Library/Application Support/Native Instruments/Reaktor 6',
                '/Library/Preferences/com.native-instruments.Reaktor6.plist',
              ]
end
