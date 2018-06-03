base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'celemony-melodyne-editor' do
  version '2.1.2,fgimian'
  sha256 '3bd99fc9fe2d172defc8083aa2eb70092fb7ca3db3e0de1cfaefa1773b4d294c'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Celemony/Melodyne singletrack.#{version.before_comma}.#{version.after_comma}.dmg")
  name 'Celemony Melodyne Editor'
  homepage 'http://www.celemony.com/en/melodyne'

  pkg 'Melodyne singletrack.pkg', allow_untrusted: true

  uninstall pkgutil: 'com.celemony.melodyne.*'

  zap delete: [
                '~/Library/Caches/com.celemony.Melodyne',
                '~/Library/Preferences/com.celemony.Melodyne singletrack.plist',
                '~/Library/Preferences/com.celemony.melodyne.singletrack.plist',
                '~/Library/Preferences/com.celemony.melodyne.uninstaller.pref.plist',
                '~/Library/Preferences/com.celemony.MelodyneSingletrackLicenser.plist',
              ]
end
