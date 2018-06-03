base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-elephant-vst-vst3' do
  version '4.5'
  sha256 'c9763bdbd0594ee270dd2b8aa8e179d7092b3414a490724e93d72491dbfe84a2'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Voxengo/VoxengoElephant_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo Elephant (VST & VST3)'
  homepage 'http://www.voxengo.com/product/elephant/'

  artifact 'Elephant.vst', target: '/Library/Audio/Plug-Ins/VST/Elephant.vst'
  artifact 'Elephant.vst3', target: '/Library/Audio/Plug-Ins/VST3/Elephant.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Elephant',
              ]
end
