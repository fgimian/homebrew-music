require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'steinberg-retrologue' do
  version '2.0.0'
  sha256 'daa2507c9a623aa82e3ff12b157020df467cdaac9889702bdf2d228ebb603a38'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Steinberg/Retrologue_2_Installer_mac.dmg")
  name 'Steinberg Retrologue'
  homepage 'https://www.steinberg.net/en/products/vst/retrologue'

  depends_on cask: 'steinberg-cubase-pro-9'

  pkg 'Retrologue.pkg'
end
