base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'steinberg-cubase-pro-9v5-update' do
  version '9.5.30'
  sha256 'c8f7c9e09f67c66e4acbc325d0d6bf17a76ffa5fc99ad6526b1232ca39de0aba'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Steinberg/Cubase_#{version}_Update_mac.dmg")
  name 'Steinberg Cubase Pro 9.5 (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  depends_on cask: 'steinberg-cubase-pro-9v5'

  pkg 'Cubase 9.5 Update.pkg'
end
