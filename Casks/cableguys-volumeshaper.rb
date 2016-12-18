require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'cableguys-volumeshaper' do
  version '4.2.3'
  sha256 'aa1f391882f8ae0abe6af999286ee766fe0a457df5e23cb582f3c81d1ad8ba8d'

  url URI::encode("file://#{base_dir}/Cableguys/Cableguys-VolumeShaper4.zip")
  name 'Cableguys VolumeShaper'
  homepage 'http://www.cableguys.com/filter-shaper.html'

  pkg "Cableguys - VolumeShaper #{version}/Mac/Cableguys - VolumeShaper #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.volumeshaper4.*'

  zap delete: [
                '~/Library/Cableguys/VolumeShaper',
                '~/Library/Preferences/de.cableguys.volumeshaper4.plist'
              ]
end
