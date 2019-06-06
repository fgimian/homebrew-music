require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-msed-au-aax' do
  version '3.1'
  sha256 'a1742db169a1c93bbee0a80acb59460f649590cffe998a86f72b9a1bd4593291'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoMSED_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo MSED (AU & AAX)'
  homepage 'http://www.voxengo.com/product/msed/'

  artifact 'MSED.component', target: '/Library/Audio/Plug-Ins/Components/MSED.component'
  artifact 'ProTools AAX/MSED.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/MSED.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/MSED',
              ]
end
