require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-tube-delay' do
  version '2.4.63-20180620-19846-3wnu1x,279860'
  sha256 'fd3b8d558b27100200f8fdcc3f3a64e858934a40b36997c18f0da4a260ae81fd'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Tube_Delay-#{version.before_comma}.zip")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg "Softube Tube Delay Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay.*'

  zap delete: [
                '~/Library/Application Support/Softube/Tube Delay.txt',
                "/Library/Application Support/Softube/Softube Tube Delay Uninstaller #{version}.pkg",
              ]
end
