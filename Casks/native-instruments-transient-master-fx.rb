require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-transient-master-fx' do
  version '1.3.1'
  sha256 '81212e23d61a654e9a1844e508c3a71d8970f1ea5e9d925e5a3941a271659e29'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Transient_Master_FX.iso")
  name 'Transient Master FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/transient-master/'

  pkg "Transient Master FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.TransientMasterFX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Transient Master FX',
                '~/Library/Preferences/com.native-instruments.TransientMasterFX.plist',
                '/Library/Application Support/Native Instruments/Transient Master FX',
                '/Library/Preferences/com.native-instruments.TransientMasterFX.plist'
              ]
end
