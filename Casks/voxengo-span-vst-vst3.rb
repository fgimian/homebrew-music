require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'voxengo-span-vst-vst3' do
  version '3.1'
  sha256 '3b981b33475fa97dab4016aafb7abc4d892dd7788240d78ba6d23917458db421'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Voxengo/VoxengoSPAN_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo SPAN (VST & VST3)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.vst', target: '/Library/Audio/Plug-Ins/VST/SPAN.vst'
  artifact 'SPAN.vst3', target: '/Library/Audio/Plug-Ins/VST3/SPAN.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN',
              ]
end
