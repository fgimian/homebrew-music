base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-massive' do
  version '1.5.1'
  sha256 'dd1ef0c545f66a2ab4b70eb3f9fd0d713ea08ba643facdd33954d6053ae12bd8'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Massive.iso")
  name 'Massive'
  homepage 'https://www.native-instruments.com/en/products/komplete/synths/massive/'

  pkg "Massive #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Massive.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Massive',
                '~/Library/Preferences/com.native-instruments.Massive.plist',
                '/Library/Application Support/Native Instruments/Massive',
                '/Library/Preferences/com.native-instruments.Massive.plist',
              ]
end
