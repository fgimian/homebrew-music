base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-blocks' do
  version '1.3.0'
  sha256 'd3edac9c02b6993d118ff109cfc9f2a900d15a71ead318f345d3ada57e75bce0'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Reaktor_Blocks.iso")
  name 'Reaktor Blocks'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-6/'

  pkg "Reaktor Blocks #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'ReaktorBlocks_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.ReaktorBlocks.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor Blocks',
                '~/Library/Preferences/com.native-instruments.ReaktorBlocks.plist',
                '/Library/Application Support/Native Instruments/Reaktor Blocks',
                '/Library/Preferences/com.native-instruments.ReaktorBlocks.plist',
              ]
end
