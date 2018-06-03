base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-the-finger-r2' do
  version '1.3.0'
  sha256 'db537a40ecc5357326382126d694da10536824839af35a715924e082aec74d71'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/The_Finger_R2.iso")
  name 'The Finger R2'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/the-finger/'

  pkg "The Finger R2 #{version} Installer Mac.pkg",
      choices: [
                 # Set library installation path
                 {
                   'choiceIdentifier' => 'TheFingerR2_Library',
                   'choiceAttribute'  => 'customLocation',
                   'attributeSetting' => ENV.fetch('NATIVE_INSTRUMENTS_CONTENT_LOCATION', '/Users/Shared'),
                 },
               ]

  uninstall pkgutil: 'com.native-instruments.TheFingerR2.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/The Finger R2',
                '~/Library/Preferences/com.native-instruments.TheFingerR2.plist',
                '/Library/Application Support/Native Instruments/The Finger R2',
                '/Library/Preferences/com.native-instruments.TheFingerR2.plist',
              ]
end
