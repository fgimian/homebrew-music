require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-razor' do
  version '1.7.0'
  sha256 '0cb7ead8265ef28e3abd84f1032ac260f9d785adf59c49ff4754acb7776a05d9'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Razor.iso")
  name 'Razor'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/razor/'

  pkg "Razor #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Razor_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Razor.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Razor',
                '~/Library/Preferences/com.native-instruments.Razor.plist',
                '/Library/Application Support/Native Instruments/Razor',
                '/Library/Preferences/com.native-instruments.Razor.plist',
              ]
end
