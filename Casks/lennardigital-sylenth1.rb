require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'lennardigital-sylenth1' do
  version '3.0.4.1'
  sha256 'a56a83958fdf560e939646da5c65a4a7bfc1f0ba74bf522ac5a0c9723332f507'

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
