require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-reaktor-6' do
  version '6.1.0'
  sha256 '8f90326e51d329ad8e005bf3051a15e89367d5c7177353a8ed84aab957f6f55c'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Reaktor_6.iso")
  name 'Reaktor 6'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/reaktor-6/'

  pkg "Reaktor 6 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Reaktor6.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Reaktor 6',
                '~/Library/Preferences/com.native-instruments.Reaktor6.plist',
                '/Library/Application Support/Native Instruments/Reaktor 6',
                '/Library/Preferences/com.native-instruments.Reaktor6.plist',
              ]
end
