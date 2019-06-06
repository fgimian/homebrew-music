require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-span-au-aax' do
  version '3.4'
  sha256 'd3d0a0498065fd1a85d6431006f279a11c6cb27b00c23291c2db7fe9838736de'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoSPAN_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo SPAN (AU & AAX)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.component', target: '/Library/Audio/Plug-Ins/Components/SPAN.component'
  artifact 'ProTools AAX/SPAN.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/SPAN.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN',
              ]
end
