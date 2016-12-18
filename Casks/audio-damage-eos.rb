require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'audio-damage-eos' do
  version '1.1.2'
  sha256 'dc92482376f45de217f279dbc4a43e07ad952910c97a2ddd5e83a8ffe75097cb'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Audio Damage/OSX_eos_#{version.gsub('.', '')}.zip")
  name 'Audio Damage Eos'
  homepage 'https://www.audiodamage.com/effects/product.php?pid=AD023'

  pkg "Eos_#{version.gsub('.', '')}.pkg"

  uninstall pkgutil: 'com.audiodamage.pkg.Eos-*'
end
