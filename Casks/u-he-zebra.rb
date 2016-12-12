require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'u-he-zebra' do
  version '2.7.2'
  sha256 '85c5fbf99b902e3787233d2d651d7e57ea5a9647df8206d68889666310b2ad62'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'u-he',
      "u-he Zebra v#{version}",
      "Zebra2_#{version.gsub('.', '_')}_Mac.zip"
    )
  )
  name 'u-he Zebra'
  homepage 'https://www.u-he.com/cms/zebra'

  pkg 'Zebra23898Mac/Zebra2 2.7.2.3898 Installer.pkg'

  uninstall pkgutil: 'com.u-he.Zebra2.*'

  zap delete: [
                '~/Library/Application Support/u-he/Zebra2',
                '~/Library/Application Support/u-he/Zebralette',
                '~/Library/Application Support/u-he/com.u-he.Zebra2.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Zebra2.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Zebra2.plist',
                '/Library/Application Support/u-he/com.u-he.Zebra2.publicparams.txt',
                '/Library/Application Support/u-he/Zebra2',
                '/Library/Application Support/u-he/Zebralette',
                '/Library/Application Support/u-he/Zebrify',
                '/Library/Application Support/u-he/ZRev',
                '/Library/Application Support/u-he/Themes/Unempty Dark Horse'
              ]
end
