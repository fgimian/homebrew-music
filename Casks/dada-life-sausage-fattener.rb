require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'dada-life-sausage-fattener' do
  version '1.1.8,Fotis Gimian APL7ICDN10'
  sha256 '4ff907c21c860f0cdc01bd55be833a8d3ac252ae91e85dc84500b67e78cfcd9d'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Dada Life/SausageFattener-#{version.before_comma}-Installer [#{version.after_comma}].pkg")
  name 'Dada Life Sausage Fattener'
  homepage 'http://www.tailorednoise.com/index.php?/plugins/sausage-fattener-by-dada-life/'

  pkg "SausageFattener-#{version.before_comma}-Installer [#{version.after_comma}].pkg"

  uninstall pkgutil: 'com.tailorednoise.SausageFattener.installer.*'

  zap delete: [
                '/Library/Logs/SausageFattener64.log',
              ]
end
