require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-native-browser-previews' do
  version '1.1.0'
  sha256 '1e7f343e8f278d5cfe3fb63da0886d5d06dbe3494555fc53640a0707e67bdfa0'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Native_Browser_Preview_Library.iso")
  name 'Native Browser Previews'
  homepage 'https://www.native-instruments.com/en/products/komplete/keyboards/komplete-kontrol-s-series/'

  pkg "Native Browser Preview Library #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.NativeBrowserPreviewLibrary.*'

  zap delete: [
                '/Library/Application Support/Native Instruments/Service Center/Native Browser Preview Library.xml',
                '/Library/Preferences/com.native-instruments.Native Browser Preview Library.plist',
              ]
end
