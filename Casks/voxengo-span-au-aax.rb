base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-span-au-aax' do
  version '3.1'
  sha256 '025163dbecae1da3c6ca5984109f3b94ee8fcbc6153242a905fa1a202d133efd'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Voxengo/VoxengoSPAN_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo SPAN (AU & AAX)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.component', target: '/Library/Audio/Plug-Ins/Components/SPAN.component'
  artifact 'ProTools AAX/SPAN.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/SPAN.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN',
              ]
end
