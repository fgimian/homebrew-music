cask 'steinberg-padshop-update' do
  # TODO: double check this version please
  version '1.1.48'
  sha256 '56e89d4cc2ae1932bde71614d844564a2f1061d767801365cd1cdbcee1c7a34d'

  url 'http://download.steinberg.net/downloads_software/vsti_au_patcher/vsti_au_patcher_mac.dmg'
  name 'Steinberg Padshop (Update)'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-padshop'

  pkg 'VSTi_AU_Patcher.pkg'
end
