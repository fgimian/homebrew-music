require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-flesh' do
  version '1.0.0'
  sha256 '51a86d8f6e0896feffde3b6db4ffa5e0e4aa2c29f78639345ac6788c2876f72e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Flesh.iso")
  name 'Flesh'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/flesh/'

  pkg "Flesh #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Flesh_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Flesh.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Flesh',
                '~/Library/Preferences/com.native-instruments.Flesh.plist',
                '/Library/Application Support/Native Instruments/Flesh',
                '/Library/Preferences/com.native-instruments.Flesh.plist',
              ]
end
