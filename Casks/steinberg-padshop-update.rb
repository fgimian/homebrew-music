require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'steinberg-padshop-update' do
  version '1.1'
  sha256 'bc2eb87e4e2b2ee9c214d7601a23155185af689fbab8ac2e308f54be2b41cbc5'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'Steinberg',
      "Steinberg Padshop v#{version}",
      'vsti_au_patcher_mac.dmg'
    )
  )
  name 'Steinberg Padshop (Update)'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  pkg 'VSTi_AU_Patcher.pkg'
end
