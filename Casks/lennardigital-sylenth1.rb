require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'lennardigital-sylenth1' do
  version '3.0.3.2'
  sha256 '4de93d088b910c52683a764bb1a64ef8c417d13e172c4b5fa3a1a538110ad41b'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/LennarDigital/Sylenth1Mac.dmg")
  name 'LennarDigital Sylenth1'
  homepage 'https://www.lennardigital.com/sylenth1/'

  pkg "Sylenth1 v#{version} Installer.pkg"

  uninstall pkgutil: 'com.lennardigital.pkg.Sylenth1.*'

  zap delete: [
                '`/Library/Application Support/LennarDigital/Sylenth1',
              ]
end
