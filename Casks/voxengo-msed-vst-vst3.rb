require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', '')

cask 'voxengo-msed-vst-vst3' do
  version '3.0'
  sha256 'f06f073bb235d63a2c972c78899c604d0eedf5017b5f3e6d81a9836edaf45ac2'

  # :base_dir was verified as official when first introduced to the cask
  url URI.encode("file://#{base_dir}/Voxengo/VoxengoMSED_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo MSED (VST & VST3)'
  homepage 'http://www.voxengo.com/product/msed/'

  artifact 'MSED.vst', target: '/Library/Audio/Plug-Ins/VST/MSED.vst'
  artifact 'MSED.vst3', target: '/Library/Audio/Plug-Ins/VST3/MSED.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/MSED',
              ]
end
