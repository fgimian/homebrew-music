base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-deft-compressor-au-aax' do
  version '1.7'
  sha256 '3087bf79a4de282296177e14cd76fe95034fcf5d1019d1198f6ded2e6c5248c7'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Voxengo/VoxengoDeftCompressor_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo Deft Compressor (AU & AAX)'
  homepage 'http://www.voxengo.com/product/deftcompressor/'

  artifact 'Deft Compressor.component', target: '/Library/Audio/Plug-Ins/Components/Deft Compressor.component'
  artifact 'ProTools AAX/Deft Compressor.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/Deft Compressor.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Deft Compressor',
              ]
end
