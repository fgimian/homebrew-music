base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-vc-76-fx' do
  version '1.3.1'
  sha256 'd00d477e31a26f841061647be7ed500329f041b15c827eee587e0307148e194a'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/VC_76_FX.iso")
  name 'VC 76 FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/vc-76/'

  pkg "VC 76 FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.VC76FX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/VC 76 FX',
                '~/Library/Preferences/com.native-instruments.VC76FX.plist',
                '/Library/Application Support/Native Instruments/VC 76 FX',
                '/Library/Preferences/com.native-instruments.VC76FX.plist',
              ]
end
