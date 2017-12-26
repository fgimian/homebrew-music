require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-saturation-knob' do
  version '2.4.36'
  sha256 '9dfb3e679fd53da984ac46ca3897420fe9be7daa641887c1c5ddde49d098952f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Saturation_Knob-2.4.36-20171117-34332-vzv352.zip")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg 'Softube Saturation Knob Installer 2.4.36 r275240.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob.*'

  zap delete: [
                '~/Library/Application Support/Softube/Saturation Knob.txt',
                "/Library/Application Support/Softube/Softube Saturation Knob Uninstaller #{version}.pkg",
              ]
end
