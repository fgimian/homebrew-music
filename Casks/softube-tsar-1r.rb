require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-tsar-1r' do
  version '2.4.83,282194'
  sha256 '464cfd23623953a2692dcb5a1668412b2521a627bfad09ed55dc066217714df7'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/Softube TSAR-1R Reverb Installer #{version.before_comma} r#{version.after_comma}.pkg")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg "Softube TSAR-1R Reverb Installer #{version.before_comma} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/TSAR-1R Reverb.aaxplugin',
                       '/Library/Application Support/Softube/SSX/TSAR-1R Reverb.ssx',
                       '/Library/Audio/Plug-Ins/Components/TSAR-1R Reverb.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/TSAR-1R Reverb.vst',
                       '/Library/Audio/Plug-Ins/VST3/TSAR-1R Reverb.vst3',
                     ]
end
