require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-vc-160-fx' do
  version '1.3.1'
  sha256 '763b4f1965b1dc276f717f5baab87da53fe5b3c2eeb62c72f4ad082fff4bf735'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/VC_160_FX.iso")
  name 'VC 160 FX'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/vc-160/'

  pkg "VC 160 FX #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.VC160FX.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/VC 160 FX',
                '~/Library/Preferences/com.native-instruments.VC160FX.plist',
                '/Library/Application Support/Native Instruments/VC 160 FX',
                '/Library/Preferences/com.native-instruments.VC160FX.plist'
              ]
end
