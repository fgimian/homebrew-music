base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-solid-dynamics-fx' do
  version '1.3.1'
  sha256 'ab96b3971a0197e81dccb30934f8951cf1d1aea3c08a8ee0c87f2046633f330f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Solid_Dynamics_FX.iso")
  name 'Solid Dynamics FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/solid-dynamics/'

  pkg "Solid Dynamics FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.SolidDynamicsFX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Solid Dynamics FX',
                '~/Library/Preferences/com.native-instruments.SolidDynamicsFX.plist',
                '/Library/Application Support/Native Instruments/Solid Dynamics FX',
                '/Library/Preferences/com.native-instruments.SolidDynamicsFX.plist',
              ]
end
