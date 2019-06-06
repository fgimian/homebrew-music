require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-tube-delay' do
  version '2.4.83,282194'
  sha256 'c8a9c04497def06d59dff0ca3715712950e7d208368c17c27540d9cb5ba2417e'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube Tube Delay Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg "Softube Tube Delay Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Tube Delay.aaxplugin',
                       '/Library/Application Support/Softube/SSX/Tube Delay.ssx',
                       '/Library/Audio/Plug-Ins/Components/Tube Delay.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/Tube Delay.vst',
                       '/Library/Audio/Plug-Ins/VST3/Tube Delay.vst3',
                     ]
end
