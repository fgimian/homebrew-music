require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-rc-24' do
  version '1.3.1'
  sha256 '105820b24285de3ac3545f467cac90b8bff35a12a7acdbc1861cdaa8872157f1'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/RC_24.iso")
  name 'RC 24'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/rc-24/'

  pkg "RC 24 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.RC24.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/RC 24',
                '~/Library/Preferences/com.native-instruments.RC24.plist',
                '/Library/Application Support/Native Instruments/RC 24',
                '/Library/Preferences/com.native-instruments.RC24.plist',
              ]
end
