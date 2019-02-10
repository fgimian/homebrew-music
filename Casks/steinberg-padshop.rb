require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-padshop' do
  version '1.2.10'
  sha256 '3739021a97d99cc8c3956fe56e370b403bc1d5fe2d3370d34d68f01655e9441a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Padshop_#{version}_Installer_mac.dmg")
  name 'Steinberg Padshop'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Padshop.pkg'

  uninstall pkgutil: 'com.steinberg.PadshopAU.padshop',
            delete:  '/Library/Audio/Plug-Ins/Components/Padshop.component'
end
