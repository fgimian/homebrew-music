require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'u-he-uhbik' do
  version '1.3.1,3898'
  sha256 '23bcacfc6277f82772246885a67c4a1ea7d3d5af4dbca48e422d46c7c240feda'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/u-he/Uhbik_#{version.before_comma.dots_to_underscores}_Mac.zip")
  name 'u-he Uhbik'
  homepage 'https://u-he.com/products/uhbik/'

  pkg "Uhbik#{version.after_comma}Mac/Uhbik #{version.before_comma}.#{version.after_comma} Installer.pkg"

  uninstall pkgutil: 'com.u-he.Uhbik.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.Runciter.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Runciter.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-A.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-A.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-D.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-D.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-F.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-F.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-G.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-G.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-P.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-P.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-Q.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-Q.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-S.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-S.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-T.Preferences.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik-T.midiassign.txt',
                '~/Library/Application Support/u-he/com.u-he.Uhbik.plist',
                '/Library/Application Support/u-he/Runciter',
                '/Library/Application Support/u-he/Uhbik-A',
                '/Library/Application Support/u-he/Uhbik-D',
                '/Library/Application Support/u-he/Uhbik-F',
                '/Library/Application Support/u-he/Uhbik-G',
                '/Library/Application Support/u-he/Uhbik-P',
                '/Library/Application Support/u-he/Uhbik-Q',
                '/Library/Application Support/u-he/Uhbik-S',
                '/Library/Application Support/u-he/Uhbik-T',
                '/Library/Application Support/u-he/Uhbik',
              ]
end
