base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-sie-q' do
  version '5.2.0.12502'
  sha256 '1c1b41dc75e2d4c0c31aa4c9c1ca3ccc7079bca7f56ccfd89a03f02897ff91fe'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Soundtoys/SieQ5_#{version}.dmg")
  name 'Soundtoys Sie-Q 5'
  homepage 'https://www.soundtoys.com/product/sie-q/'

  pkg 'Install SieQ.pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.SieQ5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
