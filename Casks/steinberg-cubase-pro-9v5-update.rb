require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-cubase-pro-9v5-update' do
  version '9.5.50'
  sha256 'a2c69d7b731430c0cf9f379e8ece7bb9d128be758c889c29262c97096bae6adc'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Steinberg/Cubase_#{version}_Update_mac.dmg")
  name 'Steinberg Cubase Pro 9.5 (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Cubase 9.5 Update.pkg'
end
