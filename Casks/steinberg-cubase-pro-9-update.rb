require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'steinberg-cubase-pro-9-update' do
  version '9.0.10'
  sha256 '773896bf97a8135ecfa38c815fa83caa4e54443ef84aa4d085a1c89af13e02cb'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Steinberg/Cubase_#{version}_Update_mac.dmg")
  name 'Steinberg Cubase Pro (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  depends_on cask: 'steinberg-cubase-pro-9'

  pkg 'Cubase 9 Update.pkg'
end
