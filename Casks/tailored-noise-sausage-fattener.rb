require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'tailored-noise-sausage-fattener' do
  version '1.01'
  sha256 '084f14595a7e78d43f19a699c6cfb5bc661b76713494b856d24d74ea5de76ffd'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Tailored Noise',
      "Tailored Noise Sausage Fattener v#{version}",
      "Sausage-Fattener-Installer-#{version}-Fotis-Gimian.dmg"
    )
  )
  name 'Tailored Noise Sausage Fattener'
  homepage 'http://www.tailorednoise.com/index.php?/plugins/sausage-fattener-by-dada-life/'

  pkg 'Sausage-Fattener-Installer.pkg'

  uninstall pkgutil: 'com.tailorednoise.SausageFattenerInstaller.*'

  zap delete: [
                '/Library/Application Support/SausageFattener'
              ]
end
