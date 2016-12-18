cask 'voxengo-voxformer-au-aax' do
  version '2.11'
  sha256 '17107defe3321a9521d55a644067f55cca4d34b42bf151338194359dfadb3809'

  url "http://www.voxengo.com/files/VoxengoVoxformer_#{version.gsub('.', '')}_Mac_AU_AAX_setup.dmg"
  name 'Voxengo Voxformer (AU & AAX)'
  homepage 'http://www.voxengo.com/product/voxformer/'

  artifact 'Voxformer.component', target: '/Library/Audio/Plug-Ins/Components/Voxformer.component'
  artifact 'ProTools AAX/Voxformer.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/Voxformer.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Voxformer',
              ]
end
