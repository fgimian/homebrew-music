require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-amp-room-essentials' do
  version '2.4.36'
  sha256 '117d6fe267d170e5f04f96037101645459fa5f7851798f2019751f0fa5e56bc1'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Amp_Room_Essentials-2.4.36-20171117-34332-322tyj.zip")
  name 'Softube Amp Room Essentials'
  homepage 'https://www.softube.com/index.php?id=arb'

  pkg 'Softube Amp Room Essentials Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Amp_Room_Essentials.*'

  zap delete: [
                '~/Library/Application Support/Softube/Bass Amp Room 8x10.txt',
                '~/Library/Application Support/Softube/Vintage Amp Room Half-Stack.txt',
                "/Library/Application Support/Softube/Softube Amp Room Essentials Uninstaller #{version}.pkg",
              ]
end
