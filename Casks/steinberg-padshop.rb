cask 'steinberg-padshop' do
  version '1.1.30'
  sha256 'bc2eb87e4e2b2ee9c214d7601a23155185af689fbab8ac2e308f54be2b41cbc5'

  url "http://download.steinberg.net/downloads_software/VSTi_Padshop/#{version}/Mac/Padshop_Installer_mac.dmg"
  name 'Steinberg Padshop'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-cubase-pro-9'

  pkg 'Padshop.pkg'
end
