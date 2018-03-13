require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-fix-flanger-and-doubler' do
  version '2.4.48'
  sha256 'bf3f44725ea6cc00f9a58993c11a68e8db9568e223ae1cea1fc4076deb9c130b'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Fix_Flanger_and_Doubler-2.4.48-20180306-84192-1dr2wom.zip")
  name 'Softube Fix Flanger and Doubler'
  homepage 'https://www.softube.com/index.php?id=fixfd'

  pkg 'Softube Fix Flanger and Doubler Installer 2.4.48 r277255.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Fix_Flanger_and_Doubler.*'

  zap delete: [
                '~/Library/Application Support/Softube/Fix Doubler.txt',
                '~/Library/Application Support/Softube/Fix Flanger.txt',
                "/Library/Application Support/Softube/Softube Fix Flanger and Doubler Uninstaller #{version}.pkg",
              ]
end
