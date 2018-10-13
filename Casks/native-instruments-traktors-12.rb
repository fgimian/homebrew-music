require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-traktors-12' do
  version '2.0.0'
  sha256 '0edf35d667bafbf69a78a81afe388c5c5216f8be1eabd1640ba53d4b9aa5257f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Traktors_12.iso")
  name 'Native Instruments Traktors 12'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/traktors-12/'

  pkg "Traktors 12 #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Traktors12_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Traktors12.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Traktors 12',
                '~/Library/Preferences/com.native-instruments.Traktors12.plist',
                '/Library/Application Support/Native Instruments/Traktors 12',
                '/Library/Preferences/com.native-instruments.Traktors12.plist',
              ]
end
