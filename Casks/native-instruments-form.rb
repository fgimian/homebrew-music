base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-form' do
  version '1.1.2'
  sha256 'd8e179c6c2e4805ccbc1827a8350e53e3c406fccd0a1519180009ed05a0704e5'

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
