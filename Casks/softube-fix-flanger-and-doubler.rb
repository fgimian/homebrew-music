require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-fix-flanger-and-doubler' do
  version '2.4.83,282194'
  sha256 '2648fa74adbd3b6ea123ada74485cb86aede7439ae038251379ea647db593e15'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube Fix Flanger and Doubler Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube Fix Flanger and Doubler'
  homepage 'https://www.softube.com/index.php?id=fixfd'

  pkg "Softube Fix Flanger and Doubler Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Fix_Flanger_and_Doubler',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Fix Doubler.aaxplugin',
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Fix Flanger.aaxplugin',
                       '/Library/Audio/Plug-Ins/Components/Fix Doubler.component',
                       '/Library/Audio/Plug-Ins/Components/Fix Flanger.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/Fix Doubler.vst',
                       '/Library/Audio/Plug-Ins/VST/Softube/Fix Flanger.vst',
                       '/Library/Audio/Plug-Ins/VST3/Fix Doubler.vst3',
                       '/Library/Audio/Plug-Ins/VST3/Fix Flanger.vst3',
                     ]
end
