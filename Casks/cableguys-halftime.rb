require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'cableguys-halftime' do
  version '1.0.1'
  sha256 'd47d3fd40d5fad2a31f9f42b82f8e8cd70031c2ca88fc652daec813430fa4de6'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Cableguys/Cableguys-HalfTime.zip")
  name 'Cableguys HalfTime'
  homepage 'http://www.cableguys.com/halftime.html'

  pkg "Cableguys - HalfTime #{version}/Mac/Cableguys - HalfTime #{version}.pkg"

  uninstall pkgutil: 'de.cableguys.pkg.halftime.*'

  zap delete: [
                '~/Library/Preferences/de.cableguys.halftime.plist',
              ]
end
