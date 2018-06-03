require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-battery-4' do
  version '4.1.6'
  sha256 'f9add92930f71ee4bffa1c6ff208660f00909bd1b0216169141a400e7086f059'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Battery_4.iso")
  name 'Battery 4'
  homepage 'https://www.native-instruments.com/en/products/komplete/drums/battery-4/'

  pkg "Battery 4 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Battery4.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Battery 4',
                '~/Library/Preferences/com.native-instruments.Battery4.plist',
                '/Library/Application Support/Native Instruments/Battery 4',
                '/Library/Preferences/com.native-instruments.Battery4.plist',
              ]
end
