require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-factory-library' do
  version '1.1.0'
  sha256 'b9528b6766c746f89c952296028b4080885883393697ff4d3ef24a1043275be2'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Reaktor_Factory_Library.iso")
  name 'Reaktor Factory Library'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-6/'

  pkg "Reaktor Factory Library #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'ReaktorFactoryLibrary_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.ReaktorFactoryLibrary.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor Factory Library',
                '~/Library/Preferences/com.native-instruments.ReaktorFactoryLibrary.plist',
                '/Library/Application Support/Native Instruments/Reaktor Factory Library',
                '/Library/Preferences/com.native-instruments.ReaktorFactoryLibrary.plist',
              ]
end
