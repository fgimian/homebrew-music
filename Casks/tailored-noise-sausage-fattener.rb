require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'tailored-noise-sausage-fattener' do
  version '1.01'
  sha256 'd6180700a9c4c10a27e46d882c9a8f6c1e9d24e8298321cb83f87f5f3157ad8b'

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
