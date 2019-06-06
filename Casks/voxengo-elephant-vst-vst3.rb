require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-elephant-vst-vst3' do
  version '4.7'
  sha256 '20b5cfc8e0124a5772429de82b82d8a51dfb1b1960d2017ef95af95bb57d09f1'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoElephant_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo Elephant (VST & VST3)'
  homepage 'http://www.voxengo.com/product/elephant/'

  artifact 'Elephant.vst', target: '/Library/Audio/Plug-Ins/VST/Elephant.vst'
  artifact 'Elephant.vst3', target: '/Library/Audio/Plug-Ins/VST3/Elephant.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Elephant',
              ]
end
