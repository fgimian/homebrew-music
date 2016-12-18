require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'softube-saturation-knob' do
  version '2.3.90'
  sha256 '11b0947004764cc8c3b719282486620d34cc2b01dc882435cfd09c809f7162fc'

  url URI::encode("file://#{base_dir}/Softube/Saturation_Knob-2.3.90-20161021-20617-1fpmmee.zip")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg "Softube Saturation Knob Installer #{version}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob.*'

  zap delete: [
                '~/Library/Application Support/Softube/Saturation Knob.txt',
                '/Library/Application Support/Softube/Softube Saturation Knob Uninstaller #{version}.pkg'
              ]
end
