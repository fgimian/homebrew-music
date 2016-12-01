require 'open-uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR',  '')

cask 'voxengo-deft-compressor-vst-vst3' do
  version '1.7'
  sha256 'f63de9393d0418897b578447a2af63377967f4501329206239fa2f541c89612a'

  url URI::encode(
    'file://' + File.join(
      base_dir,
      'Plug-ins (Effect)',
      'Voxengo',
      "Voxengo Deft Compressor v#{version}",
      "VoxengoDeftCompressor_#{version.gsub('.', '')}_Mac_VST_VST3_setup.dmg"
    )
  )
  name 'Voxengo Deft Compressor (VST & VST3)'
  homepage 'http://www.voxengo.com/product/deftcompressor/'

  artifact 'Deft Compressor.vst', target: '/Library/Audio/Plug-Ins/VST/Deft Compressor.vst'
  artifact 'Deft Compressor.vst3', target: '/Library/Audio/Plug-Ins/VST3/Deft Compressor.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/Deft Compressor'
              ]
end
