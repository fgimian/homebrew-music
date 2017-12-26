require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'steinberg-cubase-pro-9v5-update' do
  version '9.5.10'
  sha256 '122ff408ca67725b507c9780bd8c3208461b036e9300972f46b55a7b79e59595'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Steinberg/Cubase_#{version}_Update_mac.dmg")
  name 'Steinberg Cubase Pro 9.5 (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Cubase 9.5 Update.pkg'
end
