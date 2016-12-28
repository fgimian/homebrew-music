require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-reflektor' do
  version '2.0.0'
  sha256 '3e0c142196369bd20f80408473a8a4c68dbf4649f1db57faff1be467f4b8bebb'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Reflektor.iso")
  name 'Reflektor'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/reflektor/'

  pkg "Reflektor #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier'  => 'Reflektor_Library',
                   'choiceAttribute'   => 'customLocation',
                   'attributeSetting'  => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared')
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.Reflektor.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reflektor',
                '~/Library/Preferences/com.native-instruments.Reflektor.plist',
                '/Library/Application Support/Native Instruments/Reflektor',
                '/Library/Preferences/com.native-instruments.Reflektor.plist'
              ]
end
