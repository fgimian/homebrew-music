require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-komplete-kontrol' do
  version '2.0.2'
  sha256 '73318e839e368db852ffdbed9aab7242869ccf20e3c514252c0d1921b4d0afe1'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Komplete_Kontrol.iso")
  name 'Komplete Kontrol'
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
