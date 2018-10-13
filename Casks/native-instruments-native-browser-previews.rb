require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-native-browser-previews' do
  version '1.1.0'
  sha256 '50bf4805496ea4e080e599aeccac4f8e85ed609ad9960d9af87bbe553d549d40'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Native_Browser_Preview_Library.iso")
  name 'Native Instruments Native Browser Previews'
  homepage 'https://www.native-instruments.com/en/products/komplete/keyboards/komplete-kontrol-s-series/'

  pkg "Native Browser Preview Library #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.NativeBrowserPreviewLibrary.*'

  zap delete: [
                '/Library/Application Support/Native Instruments/Service Center/Native Browser Preview Library.xml',
                '/Library/Preferences/com.native-instruments.Native Browser Preview Library.plist',
              ]
end
