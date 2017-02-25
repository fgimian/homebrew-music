cask 'steinberg-cubase-pro-9-update' do
  version '9.0.10'
  sha256 '773896bf97a8135ecfa38c815fa83caa4e54443ef84aa4d085a1c89af13e02cb'

  url "http://download.steinberg.net/downloads_software/Cubase_Pro_9_and_Cubase_Artist_9/#{version}/Mac/Cubase_#{version}_Update_mac.dmg"
  name 'Steinberg Cubase Pro (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  depends_on cask: 'steinberg-cubase-pro-9'

  pkg 'Cubase 9 Update.pkg'
end
