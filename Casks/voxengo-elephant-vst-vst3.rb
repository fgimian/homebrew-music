require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'voxengo-elephant-vst-vst3' do
  version '4.4'
  sha256 'a1ad5bade01e46bebe13da8868e7096aab742b4f7020464fcf6957be871ac6e1'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Voxengo',
      "Voxengo Elephant v#{version}",
      "VoxengoElephant_#{version.gsub('.', '')}_Mac_VST_VST3_setup.dmg"
    )
  )
  name 'Voxengo Elephant (VST & VST3)'
  homepage 'http://www.voxengo.com/product/elephant/'

  artifact 'Elephant.vst', target: '/Library/Audio/Plug-Ins/VST/Elephant.vst'
  artifact 'Elephant.vst3', target: '/Library/Audio/Plug-Ins/VST3/Elephant.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Elephant'
              ]
end
