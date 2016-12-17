cask 'steinberg-cubase-pro-update' do
  version '9.0.1'
  sha256 '2abcb96745ed3ea34efedca282a94cac816312e9d223b872789eb3a3882ec389'

  url "http://download.steinberg.net/downloads_software/Cubase_Pro_9_and_Cubase_Artist_9/#{version}/Mac/Cubase_#{version}_Update_mac.dmg"
  name 'Steinberg Cubase Pro (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  depends_on cask: 'steinberg-cubase-pro'

  pkg 'Cubase 9 Update.pkg'
end
