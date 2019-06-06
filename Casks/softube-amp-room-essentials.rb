require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-amp-room-essentials' do
  version '2.4.83,282194'
  sha256 '9b2ab17a6293998ca6ae56572260a93cabfaf0052d4da228f830ddbb4f450715'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube Amp Room Essentials Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube Amp Room Essentials'
  homepage 'https://www.softube.com/index.php?id=arb'

  pkg "Softube Amp Room Essentials Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Amp_Room_Essentials',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Bass Amp Room 8x10.aaxplugin',
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Vintage Amp Room Half-Stack.aaxplugin',
                       '/Library/Audio/Plug-Ins/Components/Bass Amp Room 8x10.component',
                       '/Library/Audio/Plug-Ins/Components/Vintage Amp Room Half-Stack.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/Bass Amp Room 8x10.vst',
                       '/Library/Audio/Plug-Ins/VST/Softube/Vintage Amp Room Half-Stack.vst',
                       '/Library/Audio/Plug-Ins/VST3/Bass Amp Room 8x10.vst3',
                       '/Library/Audio/Plug-Ins/VST3/Vintage Amp Room Half-Stack.vst3',
                     ]
end
