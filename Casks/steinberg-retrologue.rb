require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'steinberg-retrologue' do
  version '2.0.0'
  sha256 'daa2507c9a623aa82e3ff12b157020df467cdaac9889702bdf2d228ebb603a38'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'Steinberg',
      "Steinberg Retrologue v#{version}",
      'Retrologue_2_Installer_mac.dmg'
    )
  )
  name 'Steinberg Retrologue'
  homepage 'https://www.steinberg.net/en/products/vst/retrologue'

  pkg 'Retrologue.pkg'
end
