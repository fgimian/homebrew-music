require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-fix-flanger-and-doubler' do
  version '2.4.36'
  sha256 'c62a92505fee4924fae88c1d54f0df93f1b06bad43155a01dc451933235fb5a7'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Fix_Flanger_and_Doubler-2.4.36-20171117-34332-1ll4y34.zip")
  name 'Softube Fix Flanger and Doubler'
  homepage 'https://www.softube.com/index.php?id=fixfd'

  pkg 'Softube Fix Flanger and Doubler Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Fix_Flanger_and_Doubler.*'

  zap delete: [
                '~/Library/Application Support/Softube/Fix Doubler.txt',
                '~/Library/Application Support/Softube/Fix Flanger.txt',
                "/Library/Application Support/Softube/Softube Fix Flanger and Doubler Uninstaller #{version}.pkg",
              ]
end
