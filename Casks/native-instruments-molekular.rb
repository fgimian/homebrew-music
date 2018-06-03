require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-molekular' do
  version '1.0.0'
  sha256 '3517d8ad7a6c03250ae5bc811e9ee19ca5c0719dedc7c3267aa57e1a46bb0667'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Molekular.iso")
  name 'Molekular'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/molekular/'

  pkg "Molekular #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Molekular_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Molekular.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Molekular',
                '~/Library/Preferences/com.native-instruments.Molekular.plist',
                '/Library/Application Support/Native Instruments/Molekular',
                '/Library/Preferences/com.native-instruments.Molekular.plist',
              ]
end
