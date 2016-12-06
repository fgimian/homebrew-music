require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'celemony-melodyne-editor' do
  version '2.1.2'
  sha256 'd2a4d6fecd323378d71fa20e1e203298e8f92e96e41c96cc44cc16ab84b0a276'

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
