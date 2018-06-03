require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-retrologue' do
  version '2.1.10'
  sha256 '0727daac2184c79635703a2e4a30987aac1e72140a157fd5cb60ca14c340282b'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Retrologue_#{version}_Installer_mac.dmg")
  name 'Steinberg Retrologue'
  homepage 'https://www.steinberg.net/en/products/vst/retrologue'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Retrologue.pkg', allow_untrusted: true
end
