require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-monark' do
  version '1.3.0'
  sha256 '9c069714011b0a2090dc8153d528e35a29ccbab1d9a588964a7251d0eae46569'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Monark.iso")
  name 'Monark'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/monark/'

  pkg "Monark #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Monark_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Monark.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Monark',
                '~/Library/Preferences/com.native-instruments.Monark.plist',
                '/Library/Application Support/Native Instruments/Monark',
                '/Library/Preferences/com.native-instruments.Monark.plist',
              ]
end
