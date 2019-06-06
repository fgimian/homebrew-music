require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-fet-compressor' do
  version '2.4.83,282194'
  sha256 '5421b058cda6a3015ebfd5fdbd15db85e28e219da99a2ec53ee70ca56b0ee20d'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube FET Compressor Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube FET Compressor'
  homepage 'https://www.softube.com/index.php?id=fc'

  pkg "Softube FET Compressor Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_FET_Compressor',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/FET Compressor.aaxplugin',
                       '/Library/Application Support/Softube/SSX/FET Compressor.ssx',
                       '/Library/Audio/Plug-Ins/Components/FET Compressor.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/FET Compressor.vst',
                       '/Library/Audio/Plug-Ins/VST3/FET Compressor.vst3',
                     ]
end
