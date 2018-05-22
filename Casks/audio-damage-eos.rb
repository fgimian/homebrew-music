require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'audio-damage-eos' do
  version '2.0.4.1'
  sha256 'f187856d559c5eb37cd6001d884fb4e4f353a3f27c858fc8405ba5cd33f3de08'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Audio Damage/AD034_Eos_#{version.no_dots}.zip")
  name 'Audio Damage Eos'
  homepage 'https://www.audiodamage.com/products/ad034-eos-2'

  pkg "AD034_Eos_#{version.no_dots}/OSX_Eos #{version.no_dots}.pkg"

  uninstall pkgutil: 'com.audiodamage.pkg.*'
end
