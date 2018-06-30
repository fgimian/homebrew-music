require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-drawmer-s73' do
  version '2.4.62-20180615-130763-17gtc70,279713'
  sha256 '60401ad2a8e4ffa2491a4cb950a960fe063a16267c51aff4702c667d33e13b62'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Drawmer_S73-#{version.before_comma}.zip")
  name 'Softube Drawmer S73'
  homepage 'https://www.softube.com/index.php?id=drawmers73'

  pkg "Softube Drawmer S73 Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Drawmer_S73.*'

  zap delete: [
                '~/Library/Application Support/Softube/Drawmer S73.txt',
                "/Library/Application Support/Softube/Softube Drawmer S73 Uninstaller #{version}.pkg",
                '/Library/Application Support/Softube/SSX/Drawmer S73.ssx',
              ]
end
