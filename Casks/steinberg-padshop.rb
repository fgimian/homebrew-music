require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'steinberg-padshop' do
  version '1.1'
  sha256 'bc2eb87e4e2b2ee9c214d7601a23155185af689fbab8ac2e308f54be2b41cbc5'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Instrument)',
      'Steinberg',
      "Steinberg Padshop v#{version}",
      'Padshop_Installer_mac.dmg'
    )
  )
  name 'Steinberg Padshop'
  homepage 'https://www.steinberg.net/en/products/vst/padshop/padshop.html'

  depends_on cask: 'steinberg-cubase-pro'

  pkg 'Padshop.pkg'
end
