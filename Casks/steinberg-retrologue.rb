require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-retrologue' do
  version '2.2.10'
  sha256 'def5ced8434874293e574a74021a6c7786e3b24d03eacfd4e74e2fb86376eda8'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Retrologue_#{version}_Installer_mac.dmg")
  name 'Steinberg Retrologue'
  homepage 'https://www.steinberg.net/en/products/vst/retrologue'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Retrologue.pkg'

  uninstall pkgutil: 'com.steinberg.RetrologueAU.retrologue',
            delete:  '/Library/Audio/Plug-Ins/Components/Retrologue.component'
end
