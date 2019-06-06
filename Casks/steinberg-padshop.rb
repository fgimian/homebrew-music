require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-padshop' do
  version '1.2.20'
  sha256 'ecaebe929010ec9c9599747ea9ef9f27014b593862cd71aeef961a26169d7ff7'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Padshop_#{version}_Installer_mac.dmg")
  name 'Steinberg Padshop'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Padshop.pkg'

  uninstall pkgutil: 'com.steinberg.PadshopAU.padshop',
            delete:  '/Library/Audio/Plug-Ins/Components/Padshop.component'
end
