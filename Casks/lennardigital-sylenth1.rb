require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'lennardigital-sylenth1' do
  version '3.0.3.0'
  sha256 'e48769d22a9e1c83cc8e2093912bfa87dd42af5c982fd98bc619523341f72cab'

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
