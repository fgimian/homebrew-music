require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-reaktor-blocks' do
  version '1.2.0'
  sha256 'ed06610ff956822f7ad625bed6e4d9edeb46ad3737fbcdd9d08795c8107be13d'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Reaktor_Blocks.iso")
  name 'Reaktor Blocks'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-6/'

  pkg "Reaktor Blocks #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier'  => 'ReaktorBlocks_Library',
                   'choiceAttribute'   => 'customLocation',
                   'attributeSetting'  => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared')
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.ReaktorBlocks.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor Blocks',
                '~/Library/Preferences/com.native-instruments.ReaktorBlocks.plist',
                '/Library/Application Support/Native Instruments/Reaktor Blocks',
                '/Library/Preferences/com.native-instruments.ReaktorBlocks.plist'
              ]
end
