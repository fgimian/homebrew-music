cask 'voxengo-span-au-aax' do
  version '3.1'
  sha256 '025163dbecae1da3c6ca5984109f3b94ee8fcbc6153242a905fa1a202d133efd'

  url "http://www.voxengo.com/files/VoxengoSPAN_#{version.gsub('.', '')}_Mac_AU_AAX_setup.dmg"
  name 'Voxengo SPAN (AU & AAX)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.component', target: '/Library/Audio/Plug-Ins/Components/SPAN.component'
  artifact 'ProTools AAX/SPAN.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/SPAN.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN',
              ]
end
