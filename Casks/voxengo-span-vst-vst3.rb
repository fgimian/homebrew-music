require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'voxengo-span-vst-vst3' do
  version '3.0'
  sha256 'ce4b3e2e7e5aa015b6323976c42443d05127724bd3e78dbdddf0c9c26e04495c'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Voxengo',
      "Voxengo SPAN v#{version}",
      "VoxengoSPAN_#{version.gsub('.', '')}_Mac_VST_VST3_setup.dmg"
    )
  )
  name 'Voxengo SPAN (VST & VST3)'
  homepage 'http://www.voxengo.com/product/span/'

  artifact 'SPAN.vst', target: '/Library/Audio/Plug-Ins/VST/SPAN.vst'
  artifact 'SPAN.vst3', target: '/Library/Audio/Plug-Ins/VST3/SPAN.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/SPAN'
              ]
end
