require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-tsar-1r' do
  version '2.4.62-20180615-130763-1drkg7m,279713'
  sha256 'a32e87f5c49357951e26e7e71c014aa4dab4a4fff3928460cd86b6bf3b2a7844'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/TSAR-1R-#{version.before_comma}.zip")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg "Softube TSAR-1R Reverb Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb.*'

  zap delete: [
                '~/Library/Application Support/Softube/TSAR-1R Reverb.txt',
                "/Library/Application Support/Softube/Softube TSAR-1R Reverb Uninstaller #{version}.pkg",
              ]
end
