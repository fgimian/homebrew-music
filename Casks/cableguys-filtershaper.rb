require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'cableguys-filtershaper' do
  version '3.3.2'
  sha256 '87cc96a62e048f68cdbac1d9b96655e8412b2f866ae1a8bd7565cf59dbd75695'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Cableguys',
      "Cableguys FilterShaper v#{version}",
      'Cableguys-FilterShaper3.zip'
    )
  )
  name 'Cableguys FilterShaper'
  homepage 'http://www.cableguys.com/filter-shaper.html'

  pkg "Cableguys - FilterShaper #{version}/Mac/Cableguys - FilterShaper #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.filtershaper.*'

  zap delete: [
                '~/Library/Cableguys/FilterShaper',
                '~/Library/Preferences/de.cableguys.filtershaper3.plist'
              ]
end
