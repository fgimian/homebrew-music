require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'cableguys-volumeshaper' do
  version '4.2.2'
  sha256 '95b001ab736ac06c197cb4fd14bd12f091a6cb5433e7dda593d4e8fdf36d17eb'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Cableguys',
      "Cableguys VolumeShaper v#{version}",
      'Cableguys-VolumeShaper4.zip'
    )
  )
  name 'Cableguys VolumeShaper'
  homepage 'http://www.cableguys.com/filter-shaper.html'

  pkg "Cableguys - VolumeShaper #{version}/Mac/Cableguys - VolumeShaper #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.volumeshaper4.*'

  zap delete: [
                '~/Library/Cableguys/VolumeShaper',
                '~/Library/Preferences/de.cableguys.volumeshaper4.plist'
              ]
end
