require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-span-vst-vst3' do
  version '3.4'
  sha256 '5da751e37acb8baafe0b5dfa6ba4883c9a02b8616ba805b604311d0c741f791a'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoSPAN_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo SPAN (VST & VST3)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.vst', target: '/Library/Audio/Plug-Ins/VST/SPAN.vst'
  artifact 'SPAN.vst3', target: '/Library/Audio/Plug-Ins/VST3/SPAN.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN',
              ]
end
