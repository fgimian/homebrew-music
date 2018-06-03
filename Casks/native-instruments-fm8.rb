require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-fm8' do
  version '1.4.1'
  sha256 '9bdc3bba456893bc7a50567f6e65d58732c04fc03ccef2ecf82252649b973c1a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/FM8.iso")
  name 'FM8'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/fm8/'

  pkg "FM8 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.FM8.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/FM8',
                '~/Library/Preferences/com.native-instruments.FM8.plist',
                '/Library/Application Support/Native Instruments/FM8',
                '/Library/Preferences/com.native-instruments.FM8.plist',
              ]
end
