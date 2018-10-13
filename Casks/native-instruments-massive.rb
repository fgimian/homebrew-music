require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-massive' do
  version '1.5.5'
  sha256 '6620408734b837145c35671d9acae473a6a9aa55c87aaed59b4d63d79c5a6d9e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Massive.iso")
  name 'Native Instruments Massive'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/massive/'

  pkg "Massive #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Massive.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Massive',
                '~/Library/Preferences/com.native-instruments.Massive.plist',
                '/Library/Application Support/Native Instruments/Massive',
                '/Library/Preferences/com.native-instruments.Massive.plist',
              ]
end
