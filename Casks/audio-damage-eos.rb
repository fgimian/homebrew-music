require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'audio-damage-eos' do
  version '2.0.5'
  sha256 'eb2ab2cd49e89e1ad26bccd327d768c446a8881314096f337c9e00077d54ef98'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Audio Damage/AD034_Eos_#{version.no_dots}.zip")
  name 'Audio Damage Eos'
  homepage 'https://www.audiodamage.com/products/ad034-eos-2'

  pkg "AD034_Eos_#{version.no_dots}/OSX_Eos_#{version.no_dots}.pkg"

  uninstall pkgutil: 'com.audiodamage.pkg.*'
end
