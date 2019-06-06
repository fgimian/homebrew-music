require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-voxformer-vst-vst3' do
  version '2.13'
  sha256 '561473b3d917dc711fcf00bede0c15f3782b71a081b58dc9ee1e0626dbe4f29a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoVoxformer_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo Voxformer (VST & VST3)'
  homepage 'http://www.voxengo.com/product/voxformer/'

  artifact 'Voxformer.vst', target: '/Library/Audio/Plug-Ins/VST/Voxformer.vst'
  artifact 'Voxformer.vst3', target: '/Library/Audio/Plug-Ins/VST3/Voxformer.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Voxformer',
              ]
end
