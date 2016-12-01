require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'celemony-melodyne-editor' do
  version '2.1.2'
  sha256 'c9b187fe53ada62be49fbeb2ef0819b263709efc152f330f0ae5de1e9c338443'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'DAWs & Drivers',
      "Celemony Melodyne Editor v#{version}",
      "Melodyne singletrack.#{version}.fgimian.dmg"
    )
  )
  name 'Celemony Melodyne Editor'
  homepage 'http://www.celemony.com/en/melodyne'

  pkg 'Melodyne singletrack.pkg'

  uninstall pkgutil: "com.celemony.melodyne.*"

  zap delete: [
                '~/Library/Caches/com.celemony.Melodyne',
                '~/Library/Preferences/com.celemony.Melodyne singletrack.plist',
                '~/Library/Preferences/com.celemony.melodyne.singletrack.plist',
                '~/Library/Preferences/com.celemony.melodyne.uninstaller.pref.plist',
                '~/Library/Preferences/com.celemony.MelodyneSingletrackLicenser.plist'
              ]
end
