require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'lennardigital-sylenth1' do
  version '3.0.2.8'
  sha256 'd32551fb0e34ba47d11797bf5e8569a4176374c3714aa4ee8b61203447e56854'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'LennarDigital',
      "LennarDigital Sylenth1 v#{version}",
      'Sylenth1Mac.dmg'
    )
  )
  name 'LennarDigital Sylenth1'
  homepage 'https://www.lennardigital.com/sylenth1/'

  pkg "Sylenth1 v#{version} Installer.pkg"

  uninstall pkgutil: 'com.lennardigital.pkg.Sylenth1.*'

  zap delete: [
                '`/Library/Application Support/LennarDigital/Sylenth1'
              ]
end
