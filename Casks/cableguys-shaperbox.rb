require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'cableguys-shaperbox' do
  version '1.0.2'
  sha256 'c6204cd5b4575aa6951a124763df553668aa4a429cbbf001988fa5daef0987ca'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Cableguys/Cableguys-ShaperBox.zip")
  name 'Cableguys ShaperBox'
  homepage 'http://www.cableguys.com/shaperbox.html'

  pkg "Cableguys - ShaperBox #{version}/Mac/Cableguys - ShaperBox #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.shaperbox.*'

  zap delete: [
                '~/Library/Cableguys/ShaperBox',
                '~/Library/Preferences/de.cableguys.shaperbox.plist',
              ]
end
