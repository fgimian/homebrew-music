require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-vari-comp' do
  version '1.3.1'
  sha256 '7dc4beb1f08c8688811fbc8ad6fb3f41733096803bcc4131354bb40f0e34aeec'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Vari_Comp.iso")
  name 'Native Instruments Vari Comp'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/vari-comp/'

  pkg "Vari Comp #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.VariComp.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Vari Comp',
                '~/Library/Preferences/com.native-instruments.VariComp.plist',
                '/Library/Application Support/Native Instruments/Vari Comp',
                '/Library/Preferences/com.native-instruments.VariComp.plist',
              ]
end
