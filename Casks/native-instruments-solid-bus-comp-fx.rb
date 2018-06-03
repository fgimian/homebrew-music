require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-solid-bus-comp-fx' do
  version '1.3.1'
  sha256 '0206b75b2bcb4f735f223c3736215f47c6793014a0b3b4de233fae11ed737fa9'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Solid_Bus_Comp_FX.iso")
  name 'Solid Bus Comp FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/solid-bus-comp/'

  pkg "Solid Bus Comp FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.SolidBusCompFX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Solid Bus Comp FX',
                '~/Library/Preferences/com.native-instruments.SolidBusCompFX.plist',
                '/Library/Application Support/Native Instruments/Solid Bus Comp FX',
                '/Library/Preferences/com.native-instruments.SolidBusCompFX.plist',
              ]
end
