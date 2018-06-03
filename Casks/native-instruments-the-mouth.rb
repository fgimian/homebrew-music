require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-the-mouth' do
  version '1.3.0'
  sha256 '634e42311c163b52cf577660ba7f5b8a5315fb90bc033307210e837756fe2893'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/The_Mouth.iso")
  name 'The Mouth'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/the-mouth/'

  pkg "The Mouth #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'TheMouth_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.TheMouth.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/The Mouth',
                '~/Library/Preferences/com.native-instruments.TheMouth.plist',
                '/Library/Application Support/Native Instruments/The Mouth',
                '/Library/Preferences/com.native-instruments.TheMouth.plist',
              ]
end
