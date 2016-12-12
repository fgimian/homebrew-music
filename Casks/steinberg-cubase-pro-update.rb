require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'steinberg-cubase-pro-update' do
  version '9.0.1'
  sha256 '2abcb96745ed3ea34efedca282a94cac816312e9d223b872789eb3a3882ec389'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'DAWs & Drivers',
      "Steinberg Cubase Pro v#{version} (Update)",
      "Cubase_#{version}_Update_mac.dmg"
    )
  )
  name 'Steinberg Cubase Pro (Update)'
  homepage 'https://www.steinberg.net/en/products/cubase'

  pkg 'Cubase 9 Update.pkg'
end
