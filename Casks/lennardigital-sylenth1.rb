require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'lennardigital-sylenth1' do
  version '3.0.5.6'
  sha256 '266e341aa108ade8575fec0574eefa93adc7a15dcdec1f2b11f9c4688c97b595'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/LennarDigital/Sylenth1Mac.dmg")
  name 'LennarDigital Sylenth1'
  homepage 'https://www.lennardigital.com/sylenth1/'

  pkg "Sylenth1 v#{version} Installer.pkg"

  uninstall pkgutil: 'com.lennardigital.pkg.Sylenth1.*'

  zap delete: [
                '`/Library/Application Support/LennarDigital/Sylenth1',
              ]
end
