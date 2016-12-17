require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'softube-tsar-1r' do
  version '2.3.90'
  sha256 '6f92c33f1481b86efd16af247a4527643a4d6a1114def46ba51f65d6fbdaf223'

  url URI::encode("file://#{base_dir}/TSAR-1R-2.3.90-20161021-20617-woh1p5.zip")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg "Softube TSAR-1R Reverb Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb.*'

  zap delete: [
                '~/Library/Application Support/Softube/TSAR-1R Reverb.txt',
                '/Library/Application Support/Softube/Softube TSAR-1R Reverb Uninstaller #{version}.pkg'
              ]
end
