require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dada-life-sausage-fattener' do
  version '1.1.5,Fotis-Gimian'
  sha256 'cb2ff7bdd740e3a2492251e1ece55e156a64ed007063e2d1143ef847253c92d1'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Dada Life/SausageFattener-#{version.before_comma}-Installer-#{version.after_comma}.dmg")
  name 'Dada Life Sausage Fattener'
  homepage 'http://www.tailorednoise.com/index.php?/plugins/sausage-fattener-by-dada-life/'

  pkg 'SausageFattener-Installer.pkg'

  uninstall pkgutil: 'com.tailorednoise.SausageFattenerInstaller.*'

  zap delete: [
                '/Library/Application Support/SausageFattener',
              ]
end
