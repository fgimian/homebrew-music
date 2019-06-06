require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-voxformer-au-aax' do
  version '2.13'
  sha256 'ddb02912fb776066ab90e316ddb6b229a5cd7593cdd6bf7e27c29857fc3687e9'

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
