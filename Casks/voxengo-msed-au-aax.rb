cask 'voxengo-msed-au-aax' do
  version '3.0'
  sha256 '641f57631434aa1008e0f5d3746bcc9569c66850dc12947f9c05e717045883fd'

  url "http://www.voxengo.com/files/VoxengoMSED_#{version.gsub('.', '')}_Mac_AU_AAX_setup.dmg"
  name 'Voxengo MSED (AU & AAX)'
  homepage 'http://www.voxengo.com/product/msed/'

  artifact 'MSED.component', target: '/Library/Audio/Plug-Ins/Components/MSED.component'
  artifact 'ProTools AAX/MSED.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/MSED.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/MSED'
              ]
end
