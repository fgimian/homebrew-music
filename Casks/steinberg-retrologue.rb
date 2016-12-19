cask 'steinberg-retrologue' do
  version '2.0.0'
  sha256 'daa2507c9a623aa82e3ff12b157020df467cdaac9889702bdf2d228ebb603a38'

  url "http://download.steinberg.net/downloads_software/VSTi_Retrologue_2/#{version}/Mac/Retrologue_2_Installer_mac.dmg"
  name 'Steinberg Retrologue'
  homepage 'https://www.steinberg.net/en/products/vst/retrologue'

  depends_on cask: 'steinberg-cubase-pro-9'

  pkg 'Retrologue.pkg'
end
