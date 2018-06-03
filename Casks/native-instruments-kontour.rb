base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-kontour' do
  version '1.0.0'
  sha256 '32075783b04549d15cfedad2bd8efca7d0cc313065712ef7b2213bac4cf8db33'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Kontour.iso")
  name 'Kontour'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/kontour/'

  pkg "Kontour #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'Kontour_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Kontour.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Kontour',
                '~/Library/Preferences/com.native-instruments.Kontour.plist',
                '/Library/Application Support/Native Instruments/Kontour',
                '/Library/Preferences/com.native-instruments.Kontour.plist',
              ]
end
