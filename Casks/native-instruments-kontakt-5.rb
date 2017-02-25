require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-kontakt-5' do
  version '5.6.6'
  sha256 '69bf9068eeb0850d857baf13c4e20812800c51577b99888f70a306295f46291f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Kontakt_5.iso")
  name 'Kontakt 5'
  homepage 'https://www.native-instruments.com/en/products/komplete/samplers/kontakt-5/'

  pkg "Kontakt 5 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Kontakt5.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Kontakt 5',
                '~/Library/Preferences/com.native-instruments.Kontakt5.plist',
                '/Library/Application Support/Native Instruments/Kontakt 5',
                '/Library/Preferences/com.native-instruments.Kontakt5.plist',
              ]
end
