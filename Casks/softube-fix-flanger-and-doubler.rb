require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-fix-flanger-and-doubler' do
  version '2.4.11'
  sha256 'bcdac47aec68497e225f1db7556881614d51ca49a287dda39245e4353146a443'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Fix_Flanger_and_Doubler-2.4.11-20170330-7740-f7vx93.zip")
  name 'Softube Fix Flanger and Doubler'
  homepage 'https://www.softube.com/index.php?id=fixfd'

  pkg 'Softube Fix Flanger and Doubler Installer 2.4.11 r270909.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Fix_Flanger_and_Doubler.*'

  zap delete: [
                '~/Library/Application Support/Softube/Fix Doubler.txt',
                '~/Library/Application Support/Softube/Fix Flanger.txt',
                "/Library/Application Support/Softube/Softube Fix Flanger and Doubler Uninstaller #{version}.pkg",
              ]
end
