require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'dada-life-sausage-fattener' do
  version '1.1.5'
  sha256 '9ade0e2bf828604cdb0bf1d119ad2e03bfdc20adb6d2c4afe0fe6814fff9c821'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Dada Life/SausageFattener-#{version}-Installer-Fotis-Gimian.dmg")
  name 'Dada Life Sausage Fattener'
  homepage 'http://www.tailorednoise.com/index.php?/plugins/sausage-fattener-by-dada-life/'

  pkg 'Sausage-Fattener-Installer.pkg'

  uninstall pkgutil: 'com.tailorednoise.SausageFattenerInstaller.*'

  zap delete: [
                '/Library/Application Support/SausageFattener',
              ]
end
