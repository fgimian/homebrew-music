require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'reveal-sound-spire-aax' do
  version '1.1.15-4127'
  sha256 '584350993553ed4ea448ff72c10b8dec381dddd460f653a1ff1c96596e348cc4'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Reveal Sound/Reveal_Sound_Spire_AAX-#{version}.zip")
  name 'Reveal Sound Spire (AAX)'
  homepage 'http://www.reveal-sound.com/'

  pkg "Reveal_Sound_Spire_AAX-#{version}/Reveal_Sound_Spire_AAX-#{version}.pkg"

  uninstall pkgutil: 'com.revealsound.spire.1.1.aax.pkg'

  zap delete: [
                '~/Library/Application Support/RevealSound',
              ]
end
