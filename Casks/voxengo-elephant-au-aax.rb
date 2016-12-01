require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'voxengo-elephant-au-aax' do
  version '4.4'
  sha256 'e202a41333b7c557bd1b1426d2bca512bcf27115d4bb8588b20c59c8578260be'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Voxengo',
      "Voxengo Elephant v#{version}",
      "VoxengoElephant_#{version.gsub('.', '')}_Mac_AU_AAX_setup.dmg"
    )
  )
  name 'Voxengo Elephant (AU & AAX)'
  homepage 'http://www.voxengo.com/product/elephant/'

  artifact 'Elephant.component', target: '/Library/Audio/Plug-Ins/Components/Elephant.component'
  artifact 'ProTools AAX/Elephant.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/Elephant.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Elephant'
              ]
end
