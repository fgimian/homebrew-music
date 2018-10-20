require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'celemony-melodyne-editor' do
  version '4.2.0.020,fgimian'
  sha256 'c99ffb861d4715a49006c425268676fd582d7ae04034e2adc870c76a3b870c76'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Celemony/Melodyne.#{version.before_comma}.#{version.after_comma}.dmg")
  name 'Celemony Melodyne Editor'
  homepage 'http://www.celemony.com/en/melodyne'

  pkg "Melodyne.#{version.before_comma}.pkg"

  uninstall pkgutil: 'com.celemony.melodyne.*'

  zap delete: [
                '~/Library/Caches/com.celemony.Melodyne',
                '~/Library/Preferences/com.celemony.melodyne.pref.plist',
                '~/Library/Preferences/com.celemony.melodyne.standalone.plist',
              ]
end
