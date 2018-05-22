require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-tsar-1r' do
  version '2.4.58-20180511-127254-1ls2zdk,278857'
  sha256 '2a3f521153a1236bacacc3f75d614fecc3b2d7a86b162fd5bd0b7545b460b7e1'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/TSAR-1R-#{version.before_comma}.zip")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg "Softube TSAR-1R Reverb Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb.*'

  zap delete: [
                '~/Library/Application Support/Softube/TSAR-1R Reverb.txt',
                "/Library/Application Support/Softube/Softube TSAR-1R Reverb Uninstaller #{version}.pkg",
              ]
end
