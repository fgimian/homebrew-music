require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-guitar-rig-5' do
  version '5.2.2'
  sha256 'b84c702a9439faf0eb9c2b74bc2d5267f185eeecd716f0300fcd2279c70b2d65'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Guitar_Rig_5.iso")
  name 'Guitar Rig 5'
  homepage 'https://www.native-instruments.com/en/products/komplete/guitar/guitar-rig-5-pro/'

  pkg "Guitar Rig 5 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.GuitarRig5.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Guitar Rig 5',
                '~/Library/Preferences/com.native-instruments.GuitarRig5.plist',
                '/Library/Application Support/Native Instruments/Guitar Rig 5',
                '/Library/Preferences/com.native-instruments.GuitarRig5.plist'
              ]
end
