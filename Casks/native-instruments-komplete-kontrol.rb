require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-komplete-kontrol' do
  version '2.0.5'
  sha256 '944d16d091d53d1219929ba37888cbfc85181e51a8a83536a6105b2463af0189'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Komplete_Kontrol_Installer.dmg")
  name 'Native Instruments Komplete Kontrol'
  homepage 'https://www.native-instruments.com/en/products/komplete/keyboards/komplete-kontrol-s-series/'

  pkg "Komplete Kontrol #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.KompleteKontrol.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Komplete Kontrol',
                '~/Library/Preferences/com.native-instruments.KompleteKontrol.plist',
                '/Library/Application Support/Native Instruments/Komplete Kontrol',
                '/Library/Preferences/com.native-instruments.KompleteKontrol.plist',
              ]
end
