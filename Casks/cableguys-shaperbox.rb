require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'cableguys-shaperbox' do
  version '1.0.2'
  sha256 'c1fa2d35a95a221c00a24c22551b3592c5513acf01c4b0e11d528c3265aae849'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Cableguys/Cableguys-ShaperBox.zip")
  name 'Cableguys ShaperBox'
  homepage 'http://www.cableguys.com/'

  pkg "Cableguys - ShaperBox #{version}/Mac/Cableguys - ShaperBox #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.shaperbox.*'

  zap delete: [
                '~/Library/Cableguys/ShaperBox',
                '~/Library/Preferences/de.cableguys.shaperbox.plist',
              ]
end
