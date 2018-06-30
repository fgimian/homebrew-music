require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-kontakt-5' do
  version '5.8.1'
  sha256 '26d62a17c1a4475674fa660a44c41821bd0b4147e57e5e1f48a1e1b32ac4b53a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Kontakt_5.iso")
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
