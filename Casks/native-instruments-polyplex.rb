require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-polyplex' do
  version '1.1.0'
  sha256 '20aacb496b65b2ae41b8ffa1f1f5b73f4b88a847592fec9d7ac27128d24bafa3'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Polyplex.iso")
  name 'Polyplex'
  homepage 'https://www.native-instruments.com/en/products/komplete/drums/polyplex/'

  pkg "Polyplex #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Polyplex_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Polyplex.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Polyplex',
                '~/Library/Preferences/com.native-instruments.Polyplex.plist',
                '/Library/Application Support/Native Instruments/Polyplex',
                '/Library/Preferences/com.native-instruments.Polyplex.plist',
              ]
end
