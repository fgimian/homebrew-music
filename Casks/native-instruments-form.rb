require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-form' do
  version '1.1.0'
  sha256 '538be24764d58a1b65fe987d2ac1140bccb4dd9be26448d5c55d00469552c830'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Form.iso")
  name 'Form'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/form/'

  pkg "Form #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Form_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Form.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Form',
                '~/Library/Preferences/com.native-instruments.Form.plist',
                '/Library/Application Support/Native Instruments/Form',
                '/Library/Preferences/com.native-instruments.Form.plist',
              ]
end
