require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-komplete-kontrol' do
  version '2.1.2'
  sha256 '1a8cb0346d4c9cc1c80f98b9d82c46c4ca978846a06f8bd9f449de7f075dbec1'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Komplete_Kontrol_Installer.dmg")
  name 'Native Instruments Komplete Kontrol'
  homepage 'https://www.native-instruments.com/en/products/komplete/keyboards/komplete-kontrol-s-series/'

  pkg "Komplete Kontrol Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.KompleteKontrol.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Komplete Kontrol',
                '~/Library/Preferences/com.native-instruments.KompleteKontrol.plist',
                '/Library/Application Support/Native Instruments/Komplete Kontrol',
                '/Library/Preferences/com.native-instruments.KompleteKontrol.plist',
              ]
end
