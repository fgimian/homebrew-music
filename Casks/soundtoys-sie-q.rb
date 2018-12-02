require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-sie-q' do
  version '5.3.0.14027r1'
  sha256 'c60f58a1f332ef8ef5fcf4f58071d98f320c5f69a4217c55c36d85eb401d5e4f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Soundtoys/SieQ5_#{version}.dmg")
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
