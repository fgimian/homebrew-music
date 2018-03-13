require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tube-delay' do
  version '2.4.48'
  sha256 'f38177b9464bb39cf5b8cccbec3fbd6c797333cba713478cdad6d107f03726f5'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Tube_Delay-2.4.48-20180306-84192-dj5hnz.zip")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg 'Softube Tube Delay Installer 2.4.48 r277255.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay.*'

  zap delete: [
                '~/Library/Application Support/Softube/Tube Delay.txt',
                "/Library/Application Support/Softube/Softube Tube Delay Uninstaller #{version}.pkg",
              ]
end
