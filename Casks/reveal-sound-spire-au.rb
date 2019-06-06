require 'addressable/uri'

base_dir = ENV.fetch('HOMEBREW_CASK_MUSIC_SOFTWARE_BASEDIR', Dir.pwd)

cask 'reveal-sound-spire-au' do
  version '1.1.15-4127'
  sha256 'ca76a23a6f5f1c106416093a87b8f4d057c288ef926ecb54d755798d11f61a83'

  # :base_dir was verified as official when first introduced to the cask
  url Addressable::URI.encode("file://#{base_dir}/Reveal Sound/Reveal_Sound_Spire_AU-#{version}.zip")
  name 'Reveal Sound Spire (AU)'
  homepage 'http://www.reveal-sound.com/'

  pkg "Reveal_Sound_Spire_AU-#{version}/Reveal_Sound_Spire_AU-#{version}.pkg"

  uninstall pkgutil: 'com.revealsound.spire.1.1.au.pkg'

  zap delete: [
                '~/Library/Application Support/RevealSound',
              ]
end
