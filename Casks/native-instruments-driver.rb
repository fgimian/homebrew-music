require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-driver' do
  version '1.3.1'
  sha256 '9919a5f908d22b16a5a00f84fad858a2df5a22d7e9a06f7cbe8594a39115b566'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Driver.iso")
  name 'Driver'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/driver/'

  pkg "Driver #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Driver.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Driver',
                '~/Library/Preferences/com.native-instruments.Driver.plist',
                '/Library/Application Support/Native Instruments/Driver',
                '/Library/Preferences/com.native-instruments.Driver.plist'
              ]
end
