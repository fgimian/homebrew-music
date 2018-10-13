require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-solid-eq-fx' do
  version '1.3.1'
  sha256 '7d5929e3ab6766c91f0a87fdc8a806f285e891324708390f166b6d17fae4727a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Solid_EQ_FX.iso")
  name 'Native Instruments Solid EQ FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/solid-eq/'

  pkg "Solid EQ FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.SolidEQFX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Solid EQ FX',
                '~/Library/Preferences/com.native-instruments.SolidEQFX.plist',
                '/Library/Application Support/Native Instruments/Solid EQ FX',
                '/Library/Preferences/com.native-instruments.SolidEQFX.plist',
              ]
end
