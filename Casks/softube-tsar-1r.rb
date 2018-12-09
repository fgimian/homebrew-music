require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'softube-tsar-1r' do
  version '2.4.74-20181029-28021-czoyyq,281289'
  sha256 'c64d2ccf93c1754fe14292fbb05c6e963d8aec74d20d703facfa1de15d5ec3ef'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Softube/TSAR-1R-#{version.before_comma}.zip")
  name 'Softube TSAR-1R'
  homepage 'https://www.softube.com/index.php?id=tsar1r'

  pkg "Softube TSAR-1R Reverb Installer #{version.major_minor_patch} r#{version.after_comma}.pkg"

  uninstall pkgutil: 'com.softube.pkg.PlugIns_TSAR-1R_Reverb',
            delete:  [
                       '/Library/Application Support/Avid/Audio/Plug-Ins/TSAR-1R Reverb.aaxplugin',
                       '/Library/Application Support/Softube/SSX/TSAR-1R Reverb.ssx',
                       '/Library/Audio/Plug-Ins/Components/TSAR-1R Reverb.component',
                       '/Library/Audio/Plug-Ins/VST/Softube/TSAR-1R Reverb.vst',
                       '/Library/Audio/Plug-Ins/VST3/TSAR-1R Reverb.vst3',
                     ]
end
