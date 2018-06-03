base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'native-instruments-replika-xt' do
  version '1.0.3'
  sha256 'c27fc83ec99b9b38b1161b14f6d08a22be56d417475e6a5074d71343225dd7e3'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Native Instruments/Replika_XT.iso")
  name 'Replika XT'
  homepage 'https://www.native-instruments.com/en/products/komplete/effects/replika-xt/'

  pkg "Replika XT #{version} Installer Mac.pkg"

  uninstall pkgutil: 'com.native-instruments.ReplikaXT.*'

  zap delete: [
                '~/Library/Application Support/Native Instruments/Replika XT',
                '~/Library/Preferences/com.native-instruments.ReplikaXT.plist',
                '/Library/Application Support/Native Instruments/Replika XT',
                '/Library/Preferences/com.native-instruments.ReplikaXT.plist',
              ]
end
