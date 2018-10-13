require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-prism' do
  version '1.6.0'
  sha256 '3f7068e918d972ff969e412f7eda277aae1eaf2e457bcb5223eb22c586d065e1'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Reaktor_Prism.iso")
  name 'Native Instruments Reaktor Prism'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-prism/'

  pkg "Reaktor Prism #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'ReaktorPrism_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.ReaktorPrism.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor Prism',
                '~/Library/Preferences/com.native-instruments.ReaktorPrism.plist',
                '/Library/Application Support/Native Instruments/Reaktor Prism',
                '/Library/Preferences/com.native-instruments.ReaktorPrism.plist',
              ]
end
