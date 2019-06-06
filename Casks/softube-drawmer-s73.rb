require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-drawmer-s73' do
  version '2.4.83,282194'
  sha256 '98186b53eccad2136bfb2b7698964eaa35a6cf8fd2b0ddcab0e7e962f2963cf4'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube Drawmer S73 Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube Drawmer S73'
  homepage 'https://www.softube.com/index.php?id=drawmers73'

  pkg "Softube Drawmer S73 Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_Drawmer_S73',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/Drawmer S73.aaxplugin',
                       '/Library/Application Support/Softube/SSX/Drawmer S73.ssx',
                       '/Library/Audio/Plug-Ins/Components/Drawmer S73.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/Drawmer S73.vst',
                       '/Library/Audio/Plug-Ins/VST3/Drawmer S73.vst3',
                     ]
end
