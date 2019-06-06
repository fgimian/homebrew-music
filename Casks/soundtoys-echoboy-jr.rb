require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'soundtoys-echoboy-jr' do
  version '5.3.0.14027r2'
  sha256 'f1b94deed73afb00eb4c2e6d1f071feb4d1015c7b7712028e46d1527171ecafe'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Soundtoys/EchoBoyJr5_#{version}.dmg")
  name 'Soundtoys EchoBoy Jr.'
  homepage 'https://www.soundtoys.com/product/echoboy-jr/'

  pkg 'Install EchoBoy Jr..pkg'

  uninstall pkgutil: 'com.soundtoys.EchoBoyJr5'

  zap delete: [
                '~/Library/Preferences/com.soundtoys.metrics.plist',
                '~/Library/Preferences/com.soundtoys.notifications.plist',
                '~/Library/Preferences/com.soundtoys.plist',
              ]
end
