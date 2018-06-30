require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-sie-q' do
  version '5.2.4.13665'
  sha256 '25e02db076fee3c1a91878cdf556f1be4a067a0e60aea7229627f374b26aa5b6'

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
