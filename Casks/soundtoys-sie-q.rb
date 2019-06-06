require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-sie-q' do
  version '5.3.0.14027r2'
  sha256 'e3f09fd9d7b5d0bb9e39bd864bcd9759dfa5dbdfbf78035f9e7353654016f0e7'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Soundtoys/SieQ5_#{version}.dmg")
  name 'Soundtoys Sie-Q 5'
  homepage 'https://www.soundtoys.com/product/sie-q/'

  pkg 'Install SieQ.pkg'

  uninstall pkgutil: 'com.soundtoys.SieQ5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
