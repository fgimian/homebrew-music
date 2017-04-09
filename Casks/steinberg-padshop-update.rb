require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'steinberg-padshop-update' do
  version '1.1.40'
  sha256 '56e89d4cc2ae1932bde71614d844564a2f1061d767801365cd1cdbcee1c7a34d'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Steinberg/vsti_au_patcher_mac.dmg")
  name 'Steinberg Padshop (Update)'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-padshop'

  pkg 'VSTi_AU_Patcher.pkg'
end
