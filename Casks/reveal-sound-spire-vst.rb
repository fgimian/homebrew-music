require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'reveal-sound-spire-vst' do
  version '1.1.15-4127'
  sha256 '10fbf0996ec030426c349d9413e47a1229e2eaadd319b701e4a441d16349b3fb'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Reveal Sound/Reveal_Sound_Spire_VST-#{version}.zip")
  name 'Reveal Sound Spire (VST)'
  homepage 'http://www.reveal-sound.com/'

  pkg "Reveal_Sound_Spire_VST-#{version}/Reveal_Sound_Spire_VST-#{version}.pkg"

  uninstall pkgutil: 'com.revealsound.spire.1.1.vst.pkg'

  zap delete: [
                '~/Library/Application Support/RevealSound',
              ]
end
