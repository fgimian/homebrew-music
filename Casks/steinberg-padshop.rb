require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-padshop' do
  version '1.1.30'
  sha256 'bc2eb87e4e2b2ee9c214d7601a23155185af689fbab8ac2e308f54be2b41cbc5'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Padshop_Installer_mac.dmg")
  name 'Steinberg Padshop'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Padshop.pkg'

  uninstall pkgutil: 'com.steinberg.PadshopAU.padshop',
            delete:  '/Library/Audio/Plug-Ins/Components/Padshop.component'
end
