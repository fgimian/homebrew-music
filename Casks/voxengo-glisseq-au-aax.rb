require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'voxengo-glisseq-au-aax' do
  version '3.11'
  sha256 '658c15263a3677dd8252310a00a9fb77d260b3e04e6d8b517045c7b54af29c66'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Voxengo/VoxengoGlissEQ_#{version.no_dots}_Mac_AU_AAX_setup.dmg")
  name 'Voxengo GlissEQ (AU & AAX)'
  homepage 'http://www.voxengo.com/product/glisseq/'

  artifact 'GlissEQ.component', target: '/Library/Audio/Plug-Ins/Components/GlissEQ.component'
  artifact 'ProTools AAX/GlissEQ.aaxplugin', target: '/Library/Application Support/Avid/Audio/Plug-Ins/GlissEQ.aaxplugin'

  zap delete: [
                '~/Library/Preferences/Voxengo/Audio Plug-Ins/GlissEQ',
              ]
end
