require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-6' do
  version '6.3.1'
  sha256 'cf9bb425b3bdfd5b008c7c604191e3b28bd9c9536d1878cf250637d444b305bd'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Reaktor_6.iso")
  name 'Native Instruments Reaktor 6'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-6/'

  pkg "Reaktor 6 Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Reaktor6.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor 6',
                '~/Library/Preferences/com.native-instruments.Reaktor6.plist',
                '/Library/Application Support/Native Instruments/Reaktor 6',
                '/Library/Preferences/com.native-instruments.Reaktor6.plist',
              ]
end
