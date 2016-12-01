require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'u-he-uhbik' do
  version '1.3.1'
  sha256 '23bcacfc6277f82772246885a67c4a1ea7d3d5af4dbca48e422d46c7c240feda'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'u-he',
      "u-he Uhbik v#{version}",
      "Uhbik_#{version.gsub('.', '_')}_Mac.zip"
    )
  )
  name 'u-he Uhbik'
  homepage 'https://www.u-he.com/cms/uhbik'

  pkg 'Uhbik3898Mac/Uhbik 1.3.1.3898 Installer.pkg'

  uninstall pkgutil: 'com.u-he.Uhbik.*'

  zap delete: [
                '~/Library/Application Support/u-he/com.u-he.Uhbik.*',
                '/Library/Application Support/u-he/Runciter',
                '/Library/Application Support/u-he/Uhbik*'
              ]
end
