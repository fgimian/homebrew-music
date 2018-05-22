require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'softube-saturation-knob' do
  version '2.4.58-20180511-127254-42uytv,278857'
  sha256 '66510ec9cc458cabdeee39199ca73038eb018e4d0c420d5b248a528f1bc898d4'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Softube/Saturation_Knob-#{version.before_comma}.zip")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg "Softube Saturation Knob Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob.*'

  zap delete: [
                '~/Library/Application Support/Softube/Saturation Knob.txt',
                "/Library/Application Support/Softube/Softube Saturation Knob Uninstaller #{version}.pkg",
              ]
end
