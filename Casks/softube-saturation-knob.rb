require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-saturation-knob' do
  version '2.4.11'
  sha256 '1e04cd728faa335e60fcbef727a603432ca8ea709c0b4527ce8cc7a884c3872f'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Saturation_Knob-2.4.11-20170330-7740-u8099u.zip")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg "Softube Saturation Knob Installer 2.4.11 r270909.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob.*'

  zap delete: [
                '~/Library/Application Support/Softube/Saturation Knob.txt',
                '/Library/Application Support/Softube/Softube Saturation Knob Uninstaller #{version}.pkg',
              ]
end
