require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tsar-1r' do
  version '2.4.36'
  sha256 '9673b0e31be7e511377710ea5a384355d9009167b393812ef28a3e985ab0c79c'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/TSAR-1R-2.4.36-20171117-34332-og11e1.zip")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg 'Softube TSAR-1R Reverb Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb.*'

  zap delete: [
                '~/Library/Application Support/Softube/TSAR-1R Reverb.txt',
                "/Library/Application Support/Softube/Softube TSAR-1R Reverb Uninstaller #{version}.pkg",
              ]
end
