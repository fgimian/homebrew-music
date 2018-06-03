base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-elephant-au-aax' do
  version '4.5'
  sha256 '41e64c9792b10c325e7558100c3a180803514384aa16cee438b64f7d5262ad88'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Voxengo/VoxengoElephant_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo Elephant (AU & AAX)'
  homepage 'http://www.voxengo.com/product/elephant/'

  artifact 'Elephant.component', target: '/Library/Audio/Plug-Ins/Components/Elephant.component'
  artifact 'ProTools AAX/Elephant.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/Elephant.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Elephant',
              ]
end
