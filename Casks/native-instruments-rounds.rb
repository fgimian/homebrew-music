require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-rounds' do
  version '1.2.0'
  sha256 '76b7e3356a31e24284761e91afacdf6815ac8541c45f8f719d70c65daa08fb10'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Rounds.iso")
  name 'Rounds'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/rounds/'

  pkg "Rounds #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Rounds_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Rounds.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Rounds',
                '~/Library/Preferences/com.native-instruments.Rounds.plist',
                '/Library/Application Support/Native Instruments/Rounds',
                '/Library/Preferences/com.native-instruments.Rounds.plist',
              ]
end
