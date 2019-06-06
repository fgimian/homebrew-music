require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-little-plate' do
  version '5.3.0.14027r2'
  sha256 '6494667750e1a38edfe94620d43d6c2305601a1b3624587ad81586bf8923143f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Soundtoys/LittlePlate5_#{version}.dmg")
  name 'Soundtoys Little Plate'
  homepage 'http://www.soundtoys.com/product/little-plate/'

  pkg 'Install Little Plate.pkg'

  uninstall pkgutil: 'com.soundtoys.LittlePlate5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
