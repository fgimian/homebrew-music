require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-voxformer-vst-vst3' do
  version '2.12'
  sha256 '8438a44282b7bbe0889ae66462a3f93cf7516736f61d07ab950ff17f46f9b5a6'

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
