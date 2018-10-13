require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-supercharger-gt' do
  version '1.3.1'
  sha256 'ec95cab557fd91dae4e786fde1d4476220daeb72f7c9b6d9d9bbd71b2848619c'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Supercharger_GT.iso")
  name 'Native Instruments Supercharger GT'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/supercharger-gt/'

  pkg "Supercharger GT #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.SuperchargerGT.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Supercharger GT',
                '~/Library/Preferences/com.native-instruments.SuperchargerGT.plist',
                '/Library/Application Support/Native Instruments/Supercharger GT',
                '/Library/Preferences/com.native-instruments.SuperchargerGT.plist',
              ]
end
