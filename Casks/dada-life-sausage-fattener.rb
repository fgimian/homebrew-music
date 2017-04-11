require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'dada-life-sausage-fattener' do
  version '1.1.5'
  sha256 '5837ebefdcece276bcb38ee8eb5f3247e393c9380e94d2a8a0fa2400638cec81'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Dada Life/SausageFattener-#{version}-Installer-Fotis-Gimian.dmg")
  name 'Dada Life Sausage Fattener'
  homepage 'http://www.tailorednoise.com/index.php?/plugins/sausage-fattener-by-dada-life/'

  pkg 'SausageFattener-Installer.pkg'

  uninstall pkgutil: 'com.tailorednoise.SausageFattenerInstaller.*'

  zap delete: [
                '/Library/Application Support/SausageFattener',
              ]
end
