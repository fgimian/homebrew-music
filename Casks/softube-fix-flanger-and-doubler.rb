require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'softube-fix-flanger-and-doubler' do
  version '2.3.90'
  sha256 '3889bd3a947f03b4d2d5331497fa9f50389bed73e406ff814ccf80f7954f109b'

  url URI::encode("file://#{base_dir}/Softube/Fix_Flanger_and_Doubler-2.3.90-20161021-20617-1mtgkye.zip")
  name 'Softube Fix Flanger and Doubler'
  homepage 'https://www.softube.com/index.php?id=fixfd'

  pkg "Softube Fix Flanger and Doubler Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Fix_Flanger_and_Doubler.*'

  zap delete: [
                '~/Library/Application Support/Softube/Fix Doubler.txt',
                '~/Library/Application Support/Softube/Fix Flanger.txt',
                '/Library/Application Support/Softube/Softube Fix Flanger and Doubler Uninstaller #{version}.pkg'
              ]
end
