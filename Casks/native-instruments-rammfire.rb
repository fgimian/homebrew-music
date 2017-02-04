require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-rammfire' do
  version '2.0.0'
  sha256 '6454108134e003c1abcbb691acd27cc8ba6825305c8fe0888e9876e0a3e6bc9f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Rammfire.iso")
  name 'Rammfire'
  homepage 'https://www.native-instruments.com/en/products/komplete/guitar/rammfire/'

  pkg "Rammfire #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Rammfire_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Rammfire.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Rammfire',
                '~/Library/Preferences/com.native-instruments.Rammfire.plist',
                '/Library/Application Support/Native Instruments/Rammfire',
                '/Library/Preferences/com.native-instruments.Rammfire.plist',
              ]
end
