require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-msed-vst-vst3' do
  version '3.1'
  sha256 '8b5df669b53e5f12ee66d5afc0049d1bbfa5b742fde925c1063d389137d499a6'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoMSED_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo MSED (VST & VST3)'
  homepage 'http://www.voxengo.com/product/msed/'

  artifact 'MSED.vst', target: '/Library/Audio/Plug-Ins/VST/MSED.vst'
  artifact 'MSED.vst3', target: '/Library/Audio/Plug-Ins/VST3/MSED.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/MSED',
              ]
end
