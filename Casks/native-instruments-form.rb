require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-form' do
  version '1.0.1'
  sha256 'aa1fee7a6ecc0b5d92f5405eff65efd5c93ecec0561e53a9ddb9cd623b82d788'

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
