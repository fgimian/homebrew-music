require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'native-instruments-phasis' do
  version '1.0.0'
  sha256 'db6e206c6feb17a49efd3f302c00e2dd6a1d3dbb92ff060a2c0067264172280f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Phasis.iso")
  name 'Phasis'
  homepage 'https://www.native-instruments.com/en/specials/happy-holidays-2017/download-phasis/'

  pkg "Phasis #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.Phasis.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Phasis',
                '~/Library/Preferences/com.native-instruments.Phasis.plist',
                '/Library/Application Support/Native Instruments/Phasis',
                '/Library/Preferences/com.native-instruments.Phasis.plist',
              ]
end
