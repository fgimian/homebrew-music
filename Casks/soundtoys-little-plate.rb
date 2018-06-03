base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-little-plate' do
  version '5.2.2.13206'
  sha256 'b3eb5c56777d8ebcd45c162afa94c28d3171294f16602b49ca5acc5caa2d1767'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Soundtoys/LittlePlate5_#{version}.dmg")
  name 'Soundtoys Little Plate'
  homepage 'http://www.soundtoys.com/product/little-plate/'

  pkg 'Install Little Plate.pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.LittlePlate5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
