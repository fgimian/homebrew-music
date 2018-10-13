require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-passive-eq' do
  version '1.3.1'
  sha256 'd1c0aae1fceee13e06c4cb8a9dc2b2248e6ca787f03399689f44d0f2641782d9'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Passive_EQ.iso")
  name 'Native Instruments Passive EQ'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/passive-eq/'

  pkg "Passive EQ #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.PassiveEQ.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Passive EQ',
                '~/Library/Preferences/com.native-instruments.PassiveEQ.plist',
                '/Library/Application Support/Native Instruments/Passive EQ',
                '/Library/Preferences/com.native-instruments.PassiveEQ.plist',
              ]
end
