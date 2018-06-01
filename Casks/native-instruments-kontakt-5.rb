require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-kontakt-5' do
  version '5.8.0'
  sha256 'f638b55b02ec1e49060b287e6f97f85a468204811d4c2d19436e8f1c90564950'

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
