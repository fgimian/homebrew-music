require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-vc-2a-fx' do
  version '1.3.1'
  sha256 '293ddf265c3f27887f2e6cfc99ab5bfd2e615816edcf2ba5a10e71cc6d294593'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/VC_2A_FX.iso")
  name 'VC 2A FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/vc-2a/'

  pkg "VC 2A FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.VC2AFX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/VC 2A FX',
                '~/Library/Preferences/com.native-instruments.VC2AFX.plist',
                '/Library/Application Support/Native Instruments/VC 2A FX',
                '/Library/Preferences/com.native-instruments.VC2AFX.plist',
              ]
end
