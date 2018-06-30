require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-saturation-knob' do
  version '2.4.64-20180620-19846-1d5hvpm,279887'
  sha256 '97e3ca880f0a88e6bfa79a71cff36891928410f4310fd319fc246ec85abd547f'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Saturation_Knob-#{version.before_comma}.zip")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg "Softube Saturation Knob Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob.*'

  zap delete: [
                '~/Library/Application Support/Softube/Saturation Knob.txt',
                "/Library/Application Support/Softube/Softube Saturation Knob Uninstaller #{version}.pkg",
              ]
end
