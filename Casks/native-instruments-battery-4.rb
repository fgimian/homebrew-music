require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-battery-4' do
  version '4.1.5'
  sha256 '9fa6c01dec9ca8055f1e45a6be2049e7d0b36ad25c4f357a5f21eece8d757314'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Battery_4.iso")
  name 'Battery 4'
  homepage 'https://www.native-instruments.com/en/products/komplete/drums/battery-4/'

  pkg "Battery 4 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Battery4.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Battery 4',
                '~/Library/Preferences/com.native-instruments.Battery4.plist',
                '/Library/Application Support/Native Instruments/Battery 4',
                '/Library/Preferences/com.native-instruments.Battery4.plist'
              ]
end
