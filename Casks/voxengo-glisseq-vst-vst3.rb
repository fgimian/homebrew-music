require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-glisseq-vst-vst3' do
  version '3.11'
  sha256 '36867e58c8b668e06eb6c2dbe026af277a2f2c5854954040d98c39a32e7209ff'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoGlissEQ_#{version.no_dots}_Mac_VST_VST3_setup.dmg")
  name 'Voxengo GlissEQ (VST & VST3)'
  homepage 'http://www.voxengo.com/product/glisseq/'

  artifact 'GlissEQ.vst', target: '/Library/Audio/Plug-Ins/VST/GlissEQ.vst'
  artifact 'GlissEQ.vst3', target: '/Library/Audio/Plug-Ins/VST3/GlissEQ.vst3'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/GlissEQ',
              ]
end
