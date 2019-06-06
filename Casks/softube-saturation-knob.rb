require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-saturation-knob' do
  version '2.4.83,282194'
  sha256 '1d2eab77098e69e1fe42bf3ffd506ebce87c6770933c2e8c8acfd9d8c084d959'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube Saturation Knob Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube Saturation Knob'
  homepage 'https://www.softube.com/index.php?id=satknob'

  pkg "Softube Saturation Knob Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Saturation_Knob',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Saturation Knob.aaxplugin',
                       '/Library/Application Support/Softube/SSX/Saturation Knob.ssx',
                       '/Library/Audio/Plug-Ins/Components/Saturation Knob.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/Saturation Knob.vst',
                       '/Library/Audio/Plug-Ins/VST3/Saturation Knob.vst3',
                     ]
end
