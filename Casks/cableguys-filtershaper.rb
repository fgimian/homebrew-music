require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'cableguys-filtershaper' do
  version '3.3.2'
  sha256 '87cc96a62e048f68cdbac1d9b96655e8412b2f866ae1a8bd7565cf59dbd75695'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Cableguys/Cableguys-FilterShaper3.zip")
  name 'Cableguys FilterShaper'
  homepage 'http://www.cableguys.com/filter-shaper.html'

  pkg "Cableguys - FilterShaper #{version}/Mac/Cableguys - FilterShaper #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.filtershaper.*'

  zap delete: [
                '~/Library/Cableguys/FilterShaper',
                '~/Library/Preferences/de.cableguys.filtershaper3.plist',
              ]
end
