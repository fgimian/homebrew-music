require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-reaktor-6' do
  version '6.2.1'
  sha256 'c597cc888377eb128b567f9352e91bca25037138dec7e3ca64a689630cfd440d'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Reaktor_6.iso")
  name 'Native Instruments Reaktor 6'
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
