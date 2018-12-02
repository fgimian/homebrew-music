require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-echoboy-jr' do
  version '5.3.0.14027r1'
  sha256 'c19608d48d1d8b49a47fdb38473169ab734d60a0ad555a6728ebd7780890bc4b'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Soundtoys/EchoBoyJr5_#{version}.dmg")
  name 'Soundtoys EchoBoy Jr.'
  homepage 'https://www.soundtoys.com/product/echoboy-jr/'

  pkg 'Install EchoBoy Jr..pkg'

  uninstall pkgutil: 'com.soundtoys.com.soundtoys.EchoBoyJr5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
