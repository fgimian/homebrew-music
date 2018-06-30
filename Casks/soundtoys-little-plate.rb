require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-little-plate' do
  version '5.2.4.13665'
  sha256 '30af77560f31fd4da86d88d5ecf98fe92ccf28967a6955b2b6a1609b5055e9a9'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Soundtoys/LittlePlate5_#{version}.dmg")
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
