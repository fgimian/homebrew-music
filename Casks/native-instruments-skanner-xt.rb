require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-skanner-xt' do
  version '1.3.0'
  sha256 'c30014e70f13f47bb9e5ef15a2038b5cd51a980e387470f3ac5defd866794847'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Skanner_XT.iso")
  name 'Native Instruments Skanner XT'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/skanner-xt/'

  pkg "Skanner XT #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'SkannerXT_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.SkannerXT.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Skanner XT',
                '~/Library/Preferences/com.native-instruments.SkannerXT.plist',
                '/Library/Application Support/Native Instruments/Skanner XT',
                '/Library/Preferences/com.native-instruments.SkannerXT.plist',
              ]
end
