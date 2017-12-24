require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tsar-1r' do
  version '2.4.11'
  sha256 'e5f7fe3be704d5261ff2ef1eb9737d4c3fa719923b99224e9b6551c9e2a25a6e'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/TSAR-1R-2.4.11-20170330-7740-1c7dzx1.zip")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg 'Softube TSAR-1R Reverb Installer 2.4.11 r270909.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb.*'

  zap delete: [
                '~/Library/Application Support/Softube/TSAR-1R Reverb.txt',
                "/Library/Application Support/Softube/Softube TSAR-1R Reverb Uninstaller #{version}.pkg",
              ]
end
