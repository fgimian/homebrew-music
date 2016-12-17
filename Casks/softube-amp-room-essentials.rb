require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'softube-amp-room-essentials' do
  version '2.3.90'
  sha256 'fc046b39fdb148a524d24714ede067d823b8b28ec9462f380ebbfae57a1d75e0'

  url URI::encode("file://#{base_dir}/Amp_Room_Essentials-2.3.90-20161021-20617-1x5biwx.zip")
  name 'Softube Amp Room Essentials'
  homepage 'https://www.softube.com/index.php?id=arb'

  pkg "Softube Amp Room Essentials Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Amp_Room_Essentials.*'

  zap delete: [
                '~/Library/Application Support/Softube/Bass Amp Room 8x10.txt',
                '~/Library/Application Support/Softube/Vintage Amp Room Half-Stack.txt',
                "/Library/Application Support/Softube/Softube Amp Room Essentials Uninstaller #{version}.pkg"
              ]
end
