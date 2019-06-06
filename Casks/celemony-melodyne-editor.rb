require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'celemony-melodyne-editor' do
  version '4.2.2.004,fgimian'
  sha256 'b1f2815797efc723a84132ff3825d713625eda14eccc6422911d7cad917f3f3b'

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
