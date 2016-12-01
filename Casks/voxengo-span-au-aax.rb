require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'voxengo-span-au-aax' do
  version '3.0'
  sha256 'fad219f7e9d0ca65d82b4e12d64b693c27367f5b3e903b7fdba8674e986fdab2'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Voxengo',
      "Voxengo SPAN v#{version}",
      "VoxengoSPAN_#{version.gsub('.', '')}_Mac_AU_AAX_setup.dmg"
    )
  )
  name 'Voxengo SPAN (AU & AAX)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.component', target: '/Library/Audio/Plug-Ins/Components/SPAN.component'
  artifact 'ProTools AAX/SPAN.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/SPAN.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN'
              ]
end
