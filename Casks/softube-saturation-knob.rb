require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-saturation-knob' do
  version '2.4.48'
  sha256 '76755de3689d0a4da6eb80518a884aedbf4cf33b0bf933864060d957ced052dc'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Saturation_Knob-2.4.48-20180306-84192-12r0m2m.zip")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg 'Softube Saturation Knob Installer 2.4.48 r277255.pkg'

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob.*'

  zap delete: [
                '~/Library/Application Support/Softube/Saturation Knob.txt',
                "/Library/Application Support/Softube/Softube Saturation Knob Uninstaller #{version}.pkg",
              ]
end
