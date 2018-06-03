require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-absynth-5' do
  version '5.3.1'
  sha256 'd947610e4f01c6c3f4911b885097e3a94f4c06371133dceb7467f589e6769c2a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Native Instruments/Absynth_5.iso")
  name 'Absynth 5'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/absynth-5/'

  pkg "Absynth 5 #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Absynth5.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Absynth 5',
                '~/Library/Preferences/com.native-instruments.Absynth5.plist',
                '/Library/Application Support/Native Instruments/Absynth 5',
                '/Library/Preferences/com.native-instruments.Absynth5.plist',
              ]
end
