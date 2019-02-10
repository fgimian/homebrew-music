require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-voxformer-au-aax' do
  version '2.12'
  sha256 'da457d717e5438881aeaac9f6486eb96a16166d4fca14e756f467b8dac40da70'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoVoxformer_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo Voxformer (AU & AAX)'
  homepage 'http://www.voxengo.com/product/voxformer/'

  artifact 'Voxformer.component', target: '/Library/Audio/Plug-Ins/Components/Voxformer.component'
  artifact 'ProTools AAX/Voxformer.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/Voxformer.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Voxformer',
              ]
end
