require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-tube-delay' do
  version '2.4.74-20181029-28021-14nmghg,281289'
  sha256 '20fae7110499f2bbcc4488f7d9720aeb76c9251687916fc8c2cbb3857b320c55'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Tube_Delay-#{version.before_comma}.zip")
  name 'Softube Tube Delay'
  homepage 'https://www.softube.com/index.php?id=td'

  pkg "Softube Tube Delay Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Tube_Delay',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Tube Delay.aaxplugin',
                       '/Library/Application Support/Softube/SSX/Tube Delay.ssx',
                       '/Library/Audio/Plug-Ins/Components/Tube Delay.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/Tube Delay.vst',
                       '/Library/Audio/Plug-Ins/VST3/Tube Delay.vst3',
                     ]
end
